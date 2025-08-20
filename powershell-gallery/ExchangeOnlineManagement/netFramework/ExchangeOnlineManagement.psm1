# Import the REST module so that the EXO* cmdlets are present before Connect-ExchangeOnline in the powershell instance.
$RestModule = "Microsoft.Exchange.Management.RestApiClient.dll"
$RestModulePath = [System.IO.Path]::Combine($PSScriptRoot, $RestModule)
Import-Module $RestModulePath 

$ExoPowershellModule = "Microsoft.Exchange.Management.ExoPowershellGalleryModule.dll"
$ExoPowershellModulePath = [System.IO.Path]::Combine($PSScriptRoot, $ExoPowershellModule)
Import-Module $ExoPowershellModulePath

#Keep track of Execution status of last cmdlet
$global:EXO_LastExecutionStatus = $true;

############# Helper Functions Begin #############

    <#
    Get the ExchangeOnlineManagement module version.
    Same function is present in the autogen module. Both the codes should be kept in sync.
    #>
    function Get-ModuleVersion
    {
        try
        {
            # Return the already computed version info if available.
            if ($script:ModuleVersion -ne $null -and $script:ModuleVersion -ne '')
            {
                Write-Verbose "Returning precomputed version info: $script:ModuleVersion"
                return $script:ModuleVersion;
            }

            $exoModule = Get-Module ExchangeOnlineManagement
            
            # Check for ExchangeOnlineManagementBeta in case the psm1 is loaded directly
            if ($exoModule -eq $null)
            {
               $exoModule = (Get-Command -Name Connect-ExchangeOnline).Module
            }

            # Get the module version from the loaded module info.
            $script:ModuleVersion = $exoModule.Version.ToString()

            # Look for prerelease information from the corresponding module manifest.
            $exoModuleRoot = (Get-Item $exoModule.Path).Directory.Parent.FullName

            $exoModuleManifestPath = Join-Path -Path $exoModuleRoot -ChildPath ExchangeOnlineManagement.psd1
            $isExoModuleManifestPathValid = Test-Path -Path $exoModuleManifestPath
            if ($isExoModuleManifestPathValid -ne $true)
            {
                # Could be a local debug build import for testing. Skip extracting prerelease info for those.
                Write-Verbose "Module manifest path invalid, path: $exoModuleManifestPath, skipping extracting prerelease info"
                return $script:ModuleVersion
            }

            $exoModuleManifestContent = Get-Content -Path $exoModuleManifestPath
            $preReleaseInfo = $exoModuleManifestContent -match "Prerelease = '(.*)'"
            if ($preReleaseInfo -ne $null)
            {
                $script:ModuleVersion = "{0}-{1}" -f $exoModule.Version.ToString(),$preReleaseInfo[0].Split('=')[1].Trim().Trim("'")
            }

            Write-Verbose "Computed version info: $script:ModuleVersion"
            return $script:ModuleVersion
        }
        catch
        {
            return [string]::Empty
        }
    }

    <#
    .Synopsis Validates a given Uri
    #>
    function Test-Uri
    {
        [CmdletBinding()]
        [OutputType([bool])]
        Param
        (
            # Uri to be validated
            [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true, Position=0)]
            [string]
            $UriString
        )

        [Uri]$uri = $UriString -as [Uri]

        $uri.AbsoluteUri -ne $null -and $uri.Scheme -eq 'https'
    }

    <#
    .Synopsis Is Cloud Shell Environment
    #>
    function global:IsCloudShellEnvironment()
    {
        return [Microsoft.Exchange.Management.AdminApiProvider.Utility]::IsCloudShellEnvironment();
    }

    <#
    .Synopsis Override Get-PSImplicitRemotingSession function for reconnection
    #>
    function global:UpdateImplicitRemotingHandler()
    {
        # Remote Powershell Sessions created by the ExchangeOnlineManagement module are given a name that starts with "ExchangeOnlineInternalSession".
        # Only modules from such sessions should be modified here, to prevent modfification of RPS tmp_* modules created by running the New-PSSession cmdlet directly, or when connecting to exchange on-prem tenants.
        $existingPSSession = Get-PSSession | Where-Object {$_.ConfigurationName -like "Microsoft.Exchange" -and $_.Name -like "ExchangeOnlineInternalSession*"}

        if ($existingPSSession.count -gt 0) 
        {
            foreach ($session in $existingPSSession)
            {
                $module = Get-Module $session.CurrentModuleName
                if ($module -eq $null)
                {
                    continue
                }

                [bool]$moduleProcessed = $false
                [string] $moduleUrl = $module.Description
                [int] $queryStringIndex = $moduleUrl.IndexOf("?")

                if ($queryStringIndex -gt 0)
                {
                    $moduleUrl = $moduleUrl.SubString(0,$queryStringIndex)
                }

                if ($moduleUrl.EndsWith("/PowerShell-LiveId", [StringComparison]::OrdinalIgnoreCase) -or $moduleUrl.EndsWith("/PowerShell", [StringComparison]::OrdinalIgnoreCase))
                {
                    & $module { ${function:Get-PSImplicitRemotingSession} = `
                    {
                        param(
                            [Parameter(Mandatory = $true, Position = 0)]
                            [string]
                            $commandName
                        )

                        $shouldRemoveCurrentSession = $false;
                        # Clear any left over PS tmp modules
                        if (($script:PSSession -ne $null) -and ($script:PSSession.PreviousModuleName -ne $null) -and ($script:PSSession.PreviousModuleName -ne $script:MyModule.Name))
                        {
                            $null = Remove-Module -Name $script:PSSession.PreviousModuleName -ErrorAction SilentlyContinue
                            $script:PSSession.PreviousModuleName = $null
                        }

                        if (($script:PSSession -eq $null) -or ($script:PSSession.Runspace.RunspaceStateInfo.State -ne 'Opened'))
                        {
                            Set-PSImplicitRemotingSession `
                                (& $script:GetPSSession `
                                    -InstanceId $script:PSSession.InstanceId.Guid `
                                    -ErrorAction SilentlyContinue )
                        }
                        if ($script:PSSession -ne $null)
                        {
                            if ($script:PSSession.Runspace.RunspaceStateInfo.State -eq 'Disconnected')
                            {
                                # If we are handed a disconnected session, try re-connecting it before creating a new session.
                                Set-PSImplicitRemotingSession `
                                    (& $script:ConnectPSSession `
                                        -Session $script:PSSession `
                                        -ErrorAction SilentlyContinue)
                            }
                            else
                            {
                                # Import the module once more to ensure that Test-ActiveToken is present
                                Import-Module $global:_EXO_ModulePath -Cmdlet Test-ActiveToken;

                                # If there is no active token run the new session flow
                                $hasActiveToken = Test-ActiveToken -TokenExpiryTime $script:PSSession.TokenExpiryTime
                                $sessionIsOpened = $script:PSSession.Runspace.RunspaceStateInfo.State -eq 'Opened'
                                if (($hasActiveToken -eq $false) -or ($sessionIsOpened -ne $true))
                                {
                                    #If there is no active user token or opened session then ensure that we remove the old session
                                    $shouldRemoveCurrentSession = $true;
                                }
                            }
                        }
                        if (($script:PSSession -eq $null) -or ($script:PSSession.Runspace.RunspaceStateInfo.State -ne 'Opened') -or ($shouldRemoveCurrentSession -eq $true))
                        {
                            # Import the module once more to ensure that New-ExoPSSession is present
                            Import-Module $global:_EXO_ModulePath -Cmdlet New-ExoPSSession;

                            Write-PSImplicitRemotingMessage ('Creating a new Remote PowerShell session using Modern Authentication for implicit remoting of "{0}" command ...' -f $commandName)
                            $session = New-ExoPSSession -PreviousSession $script:PSSession

                            if ($session -ne $null)
                            {
                                if ($shouldRemoveCurrentSession -eq $true)
                                {
                                    Remove-PSSession $script:PSSession
                                }

                                # Import the latest session to ensure that the next cmdlet call would occur on the new PSSession instance.
                                if ([string]::IsNullOrEmpty($script:MyModule.ModulePrefix))
                                {
                                    $PSSessionModuleInfo = Import-PSSession $session -AllowClobber -DisableNameChecking -CommandName $script:MyModule.CommandName -FormatTypeName $script:MyModule.FormatTypeName
                                }
                                else
                                {
                                    $PSSessionModuleInfo = Import-PSSession $session -AllowClobber -DisableNameChecking -CommandName $script:MyModule.CommandName -FormatTypeName $script:MyModule.FormatTypeName -Prefix $script:MyModule.ModulePrefix
                                }

                                # Add the name of the module to clean up in case of removing the broken session
                                $session | Add-Member -NotePropertyName "CurrentModuleName" -NotePropertyValue $PSSessionModuleInfo.Name

                                $CurrentModule = Import-Module $PSSessionModuleInfo.Path -Global -DisableNameChecking -Prefix $script:MyModule.ModulePrefix -PassThru
                                $CurrentModule | Add-Member -NotePropertyName "ModulePrefix" -NotePropertyValue $script:MyModule.ModulePrefix
                                $CurrentModule | Add-Member -NotePropertyName "CommandName" -NotePropertyValue $script:MyModule.CommandName
                                $CurrentModule | Add-Member -NotePropertyName "FormatTypeName" -NotePropertyValue $script:MyModule.FormatTypeName

                                $session | Add-Member -NotePropertyName "PreviousModuleName" -NotePropertyValue $script:MyModule.Name

                                UpdateImplicitRemotingHandler
                                $script:PSSession = $session
                            }
                        }
                        if (($script:PSSession -eq $null) -or ($script:PSSession.Runspace.RunspaceStateInfo.State -ne 'Opened'))
                        {
                            throw 'No session has been associated with this implicit remoting module'
                        }

                        return [Management.Automation.Runspaces.PSSession]$script:PSSession
                    }}
                }
            }
        }
    }

    <#
    .SYNOPSIS Extract organization name from UserPrincipalName
    #>
    function Get-OrgNameFromUPN
    {
        param([string] $UPN)
        $fields = $UPN -split '@'
        return $fields[-1]
    }

    <#
    .SYNOPSIS Get the command from the given module
    #>
    function global:Get-WrappedCommand
    {
        param(
        [string] $CommandName,
        [string] $ModuleName,
        [string] $CommandType)

        $cmd = (Get-Module $moduleName).ExportedFunctions[$CommandName]
        return $cmd
    }

    <#
    .Synopsis Writes a message to the console in Yellow.
    Call this method with caution since it uses Write-Host internally which cannot be suppressed by the user.
    #>
    function Write-Message
    {
        param([string] $message)
        Write-Host $message -ForegroundColor Yellow
    }

############# Helper Functions End #############

###### Begin Main ######

$EOPConnectionInProgress = $false
function Connect-ExchangeOnline 
{
    [CmdletBinding()]
    param(

        # Connection Uri for the Remote PowerShell endpoint
        [string] $ConnectionUri = '',

        # Azure AD Authorization endpoint Uri that can issue the OAuth2 access tokens
        [string] $AzureADAuthorizationEndpointUri = '',

        # Exchange Environment name
        [Microsoft.Exchange.Management.RestApiClient.ExchangeEnvironment] $ExchangeEnvironmentName = 'O365Default',

        # PowerShell session options to be used when opening the Remote PowerShell session
        [System.Management.Automation.Remoting.PSSessionOption] $PSSessionOption = $null,

        # Switch to bypass use of mailbox anchoring hint.
        [switch] $BypassMailboxAnchoring = $false,

        # Delegated Organization Name
        [string] $DelegatedOrganization = '',

        # Prefix 
        [string] $Prefix = '',

        # Show Banner of Exchange cmdlets Mapping and recent updates
        [switch] $ShowBanner = $true,

        #Cmdlets to Import for rps cmdlets , by default it would bring all
        [string[]] $CommandName = @("*"),

        #The way the output objects would be printed on the console
        [string[]] $FormatTypeName = @("*"),

        # Use Remote PowerShell Session based connection
        [switch] $UseRPSSession = $false,

        # Use to Skip Exchange Format file loading into current shell.
        [switch] $SkipLoadingFormatData = $false,

        # Use to skip downloading and loading the help files into the current connection.
        [switch] $SkipLoadingCmdletHelp = $true,

        # Use to enable downloading and loading the help files into the current connection.
        [switch] $LoadCmdletHelp = $false,

        # Externally provided access token
        [string] $AccessToken = '',

        # Client certificate to sign the temp module
        [System.Security.Cryptography.X509Certificates.X509Certificate2] $SigningCertificate = $null,

        # switch to disable WAM
        [switch] $DisableWAM = $false
    )
    DynamicParam
    {
        if (($isCloudShell = IsCloudShellEnvironment) -eq $false)
        {
            $attributes = New-Object System.Management.Automation.ParameterAttribute
            $attributes.Mandatory = $false

            $attributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $attributeCollection.Add($attributes)

            # User Principal Name or email address of the user
            $UserPrincipalName = New-Object System.Management.Automation.RuntimeDefinedParameter('UserPrincipalName', [string], $attributeCollection)
            $UserPrincipalName.Value = ''

            # User Credential to Logon
            $Credential = New-Object System.Management.Automation.RuntimeDefinedParameter('Credential', [System.Management.Automation.PSCredential], $attributeCollection)
            $Credential.Value = $null

            # Certificate
            $Certificate = New-Object System.Management.Automation.RuntimeDefinedParameter('Certificate', [System.Security.Cryptography.X509Certificates.X509Certificate2], $attributeCollection)
            $Certificate.Value = $null

            # Certificate Path 
            $CertificateFilePath = New-Object System.Management.Automation.RuntimeDefinedParameter('CertificateFilePath', [string], $attributeCollection)
            $CertificateFilePath.Value = ''

            # Certificate Password
            $CertificatePassword = New-Object System.Management.Automation.RuntimeDefinedParameter('CertificatePassword', [System.Security.SecureString], $attributeCollection)
            $CertificatePassword.Value = $null

            # Certificate Thumbprint
            $CertificateThumbprint = New-Object System.Management.Automation.RuntimeDefinedParameter('CertificateThumbprint', [string], $attributeCollection)
            $CertificateThumbprint.Value = ''

            # Application Id
            $AppId = New-Object System.Management.Automation.RuntimeDefinedParameter('AppId', [string], $attributeCollection)
            $AppId.Value = ''

            # Organization
            $Organization = New-Object System.Management.Automation.RuntimeDefinedParameter('Organization', [string], $attributeCollection)
            $Organization.Value = ''

            # Switch to collect telemetry on command execution. 
            $EnableErrorReporting = New-Object System.Management.Automation.RuntimeDefinedParameter('EnableErrorReporting', [switch], $attributeCollection)
            $EnableErrorReporting.Value = $false
            
            # Where to store EXO command telemetry data. By default telemetry is stored in the directory "%TEMP%/EXOTelemetry" in the file : EXOCmdletTelemetry-yyyymmdd-hhmmss.csv.
            $LogDirectoryPath = New-Object System.Management.Automation.RuntimeDefinedParameter('LogDirectoryPath', [string], $attributeCollection)
            $LogDirectoryPath.Value = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "EXOCmdletTelemetry")

            # Create a new attribute and valiate set against the LogLevel
            $LogLevelAttribute = New-Object System.Management.Automation.ParameterAttribute
            $LogLevelAttribute.Mandatory = $false
            $LogLevelAttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $LogLevelAttributeCollection.Add($LogLevelAttribute)
            $LogLevelList = @([Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel]::Default, [Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel]::All)
            $ValidateSet = New-Object System.Management.Automation.ValidateSetAttribute($LogLevelList)
            $LogLevel = New-Object System.Management.Automation.RuntimeDefinedParameter('LogLevel', [Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel], $LogLevelAttributeCollection)
            $LogLevel.Attributes.Add($ValidateSet)

            # Switch to use Managed Identity flow. 
            $ManagedIdentity = New-Object System.Management.Automation.RuntimeDefinedParameter('ManagedIdentity', [switch], $attributeCollection)
            $ManagedIdentity.Value = $false

            # ManagedIdentityAccountId to be used in case of User Assigned Managed Identity flow
            $ManagedIdentityAccountId = New-Object System.Management.Automation.RuntimeDefinedParameter('ManagedIdentityAccountId', [string], $attributeCollection)
            $ManagedIdentityAccountId.Value = ''

# EXO params start

            # Switch to track perfomance 
            $TrackPerformance = New-Object System.Management.Automation.RuntimeDefinedParameter('TrackPerformance', [bool], $attributeCollection)
            $TrackPerformance.Value = $false

            # Flag to enable or disable showing the number of objects written
            $ShowProgress = New-Object System.Management.Automation.RuntimeDefinedParameter('ShowProgress', [bool], $attributeCollection)
            $ShowProgress.Value = $false

            # Switch to enable/disable Multi-threading in the EXO cmdlets
            $UseMultithreading = New-Object System.Management.Automation.RuntimeDefinedParameter('UseMultithreading', [bool], $attributeCollection)
            $UseMultithreading.Value = $true

            # Pagesize Param
            $PageSize = New-Object System.Management.Automation.RuntimeDefinedParameter('PageSize', [uint32], $attributeCollection)
            $PageSize.Value = 1000

            # Switch to MSI auth 
            $Device = New-Object System.Management.Automation.RuntimeDefinedParameter('Device', [switch], $attributeCollection)
            $Device.Value = $false

            # Switch to CmdInline parameters
            $InlineCredential = New-Object System.Management.Automation.RuntimeDefinedParameter('InlineCredential', [switch], $attributeCollection)
            $InlineCredential.Value = $false

# EXO params end
            $paramDictionary = New-object System.Management.Automation.RuntimeDefinedParameterDictionary
            $paramDictionary.Add('UserPrincipalName', $UserPrincipalName)
            $paramDictionary.Add('Credential', $Credential)
            $paramDictionary.Add('Certificate', $Certificate)
            $paramDictionary.Add('CertificateFilePath', $CertificateFilePath)
            $paramDictionary.Add('CertificatePassword', $CertificatePassword)
            $paramDictionary.Add('AppId', $AppId)
            $paramDictionary.Add('Organization', $Organization)
            $paramDictionary.Add('EnableErrorReporting', $EnableErrorReporting)
            $paramDictionary.Add('LogDirectoryPath', $LogDirectoryPath)
            $paramDictionary.Add('LogLevel', $LogLevel)
            $paramDictionary.Add('TrackPerformance', $TrackPerformance)
            $paramDictionary.Add('ShowProgress', $ShowProgress)
            $paramDictionary.Add('UseMultithreading', $UseMultithreading)
            $paramDictionary.Add('PageSize', $PageSize)
            $paramDictionary.Add('ManagedIdentity', $ManagedIdentity)
            $paramDictionary.Add('ManagedIdentityAccountId', $ManagedIdentityAccountId)
            if($PSEdition -eq 'Core')
            {
                $paramDictionary.Add('Device', $Device)
                $paramDictionary.Add('InlineCredential', $InlineCredential);
                # We do not want to expose certificate thumprint in Linux as it is not feasible there.
                if($IsWindows)
                {
                    $paramDictionary.Add('CertificateThumbprint', $CertificateThumbprint);
                }
            }
            else 
            {
                $paramDictionary.Add('CertificateThumbprint', $CertificateThumbprint);
            }

            return $paramDictionary
        }
        else
        {
            $attributes = New-Object System.Management.Automation.ParameterAttribute
            $attributes.Mandatory = $false

            $attributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $attributeCollection.Add($attributes)

            # Switch to MSI auth 
            $Device = New-Object System.Management.Automation.RuntimeDefinedParameter('Device', [switch], $attributeCollection)
            $Device.Value = $false

            # Switch to collect telemetry on command execution. 
            $EnableErrorReporting = New-Object System.Management.Automation.RuntimeDefinedParameter('EnableErrorReporting', [switch], $attributeCollection)
            $EnableErrorReporting.Value = $false
            
            # Where to store EXO command telemetry data. By default telemetry is stored in the directory "%TEMP%/EXOTelemetry" in the file : EXOCmdletTelemetry-yyyymmdd-hhmmss.csv.
            $LogDirectoryPath = New-Object System.Management.Automation.RuntimeDefinedParameter('LogDirectoryPath', [string], $attributeCollection)
            $LogDirectoryPath.Value = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "EXOCmdletTelemetry")

            # Create a new attribute and validate set against the LogLevel
            $LogLevelAttribute = New-Object System.Management.Automation.ParameterAttribute
            $LogLevelAttribute.Mandatory = $false
            $LogLevelAttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $LogLevelAttributeCollection.Add($LogLevelAttribute)
            $LogLevelList = @([Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel]::Default, [Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel]::All)
            $ValidateSet = New-Object System.Management.Automation.ValidateSetAttribute($LogLevelList)
            $LogLevel = New-Object System.Management.Automation.RuntimeDefinedParameter('LogLevel', [Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel], $LogLevelAttributeCollection)
            $LogLevel.Attributes.Add($ValidateSet)

            # Switch to CmdInline parameters
            $InlineCredential = New-Object System.Management.Automation.RuntimeDefinedParameter('InlineCredential', [switch], $attributeCollection)
            $InlineCredential.Value = $false

            # User Credential to Logon
            $Credential = New-Object System.Management.Automation.RuntimeDefinedParameter('Credential', [System.Management.Automation.PSCredential], $attributeCollection)
            $Credential.Value = $null

            $paramDictionary = New-object System.Management.Automation.RuntimeDefinedParameterDictionary
            $paramDictionary.Add('Device', $Device)
            $paramDictionary.Add('EnableErrorReporting', $EnableErrorReporting)
            $paramDictionary.Add('LogDirectoryPath', $LogDirectoryPath)
            $paramDictionary.Add('LogLevel', $LogLevel)
            $paramDictionary.Add('Credential', $Credential)
            $paramDictionary.Add('InlineCredential', $InlineCredential)
            return $paramDictionary
        }
    }
    process {
        $global:EXO_LastExecutionStatus = $true;
        $EnableSearchOnlySession = $false
        $var = Get-Variable -Name "EnableSearchOnlySession" -Scope Script -ErrorAction SilentlyContinue
        if ($null -ne $var) {
            $EnableSearchOnlySession = $var.Value
        }
        $startTime = Get-Date

        # Validate parameters
        if (($ConnectionUri -ne '') -and (-not (Test-Uri $ConnectionUri)))
        {
            $global:EXO_LastExecutionStatus = $false;
            throw "Invalid ConnectionUri parameter '$ConnectionUri'"
        }
        if (($AzureADAuthorizationEndpointUri -ne '') -and (-not (Test-Uri $AzureADAuthorizationEndpointUri)))
        {
            $global:EXO_LastExecutionStatus = $false;
            throw "Invalid AzureADAuthorizationEndpointUri parameter '$AzureADAuthorizationEndpointUri'"
        }
        if (($Prefix -ne ''))
        {
            if ($Prefix -notmatch '^[a-z0-9]+$') 
            {
                $global:EXO_LastExecutionStatus = $false;
                throw "Use of any special characters in the Prefix string is not supported."
            }
            if ($Prefix -eq 'EXO') 
            {
                $global:EXO_LastExecutionStatus = $false;
                throw "Prefix 'EXO' is a reserved Prefix, please use a different prefix."
            }
        }

        # Keep track of error count at beginning.
        $errorCountAtStart = $global:Error.Count;
        try
        {
            $moduleVersion = Get-ModuleVersion
            Write-Verbose "ModuleVersion: $moduleVersion"

            # Generate a ConnectionId to use in all logs and to send in all server calls.
            $connectionContextID = [System.Guid]::NewGuid()

            $cmdletLogger = New-CmdletLogger -ExoModuleVersion $moduleVersion -LogDirectoryPath $LogDirectoryPath.Value -EnableErrorReporting:$EnableErrorReporting.Value -ConnectionId $connectionContextID -IsRpsSession:$UseRPSSession.IsPresent
            $logFilePath = $cmdletLogger.GetCurrentLogFilePath()
            
            if ($EnableErrorReporting.Value -eq $true -and $UseRPSSession -eq $false)
            {
                Write-Message ("Writing cmdlet logs to " + $logFilePath)
            }

            $cmdletLogger.InitLog($connectionContextID)
            $cmdletLogger.LogStartTime($connectionContextID, $startTime)
            if ($EOPConnectionInProgress -eq $true)
            {
                $cmdletLogger.LogCmdletName($connectionContextID, "Connect-IPPSSession");
            }
            else
            {
                $cmdletLogger.LogCmdletName($connectionContextID, "Connect-ExchangeOnline");
            }
            $cmdletLogger.LogCmdletParameters($connectionContextID, $PSBoundParameters);

            if ($isCloudShell -eq $false)
            {
                $ConnectionContext = Get-ConnectionContext -ExchangeEnvironmentName $ExchangeEnvironmentName -ConnectionUri $ConnectionUri `
                -AzureADAuthorizationEndpointUri $AzureADAuthorizationEndpointUri -UserPrincipalName $UserPrincipalName.Value `
                -PSSessionOption $PSSessionOption -Credential $Credential.Value -BypassMailboxAnchoring:$BypassMailboxAnchoring `
                -DelegatedOrg $DelegatedOrganization -Certificate $Certificate.Value -CertificateFilePath $CertificateFilePath.Value `
                -CertificatePassword $CertificatePassword.Value -CertificateThumbprint $CertificateThumbprint.Value -AppId $AppId.Value `
                -Organization $Organization.Value -Device:$Device.Value -InlineCredential:$InlineCredential.Value -CommandName $CommandName `
                -FormatTypeName $FormatTypeName -Prefix $Prefix -PageSize $PageSize.Value -ExoModuleVersion:$moduleVersion -Logger $cmdletLogger `
                -ConnectionId $connectionContextID -IsRpsSession $UseRPSSession.IsPresent -EnableErrorReporting:$EnableErrorReporting.Value `
                -ManagedIdentity:$ManagedIdentity.Value -ManagedIdentityAccountId $ManagedIdentityAccountId.Value -AccessToken $AccessToken -DisableWAM:$DisableWAM -LogDirectoryPath $LogDirectoryPath.Value -EnableSearchOnlySession $EnableSearchOnlySession
            }
            else
            {
                $ConnectionContext = Get-ConnectionContext -ExchangeEnvironmentName $ExchangeEnvironmentName -ConnectionUri $ConnectionUri `
                -AzureADAuthorizationEndpointUri $AzureADAuthorizationEndpointUri -Credential $Credential.Value -PSSessionOption $PSSessionOption `
                -BypassMailboxAnchoring:$BypassMailboxAnchoring -Device:$Device.Value -InlineCredential:$InlineCredential.Value `
                -DelegatedOrg $DelegatedOrganization -CommandName $CommandName -FormatTypeName $FormatTypeName -Prefix $prefix -ExoModuleVersion:$moduleVersion `
                -Logger $cmdletLogger -ConnectionId $connectionContextID -IsRpsSession $UseRPSSession.IsPresent -EnableErrorReporting:$EnableErrorReporting.Value -AccessToken $AccessToken -DisableWAM:$DisableWAM -LogDirectoryPath $LogDirectoryPath.Value -EnableSearchOnlySession $EnableSearchOnlySession
            }

            if ($isCloudShell -eq $false)
            {
                $global:_EXO_EnableErrorReporting = $EnableErrorReporting.Value;
            }

            if ($ShowBanner -eq $true)
            {
                try
                {
                    $BannerContent = Get-EXOBanner -ConnectionContext:$ConnectionContext -IsRPSSession:$UseRPSSession.IsPresent
                    Write-Host -ForegroundColor Yellow $BannerContent
                }
                catch
                {
                    Write-Verbose "Failed to fetch banner content from server. Reason: $_"
                    $cmdletLogger.LogGenericError($connectionContextID, $_);
                }
            }

            if (($ConnectionUri -ne '') -and ($AzureADAuthorizationEndpointUri -eq ''))
            {
                Write-Information "Using ConnectionUri:'$ConnectionUri', in the environment:'$ExchangeEnvironmentName'."
            }
            if (($AzureADAuthorizationEndpointUri -ne '') -and ($ConnectionUri -eq ''))
            {
                Write-Information "Using AzureADAuthorizationEndpointUri:'$AzureADAuthorizationEndpointUri', in the environment:'$ExchangeEnvironmentName'."
            }

            $ImportedModuleName = '';
            $LogModuleDirectoryPath = [System.IO.Path]::GetTempPath();

            if ($UseRPSSession -eq $true)
            {
                $ExoPowershellModule = "Microsoft.Exchange.Management.ExoPowershellGalleryModule.dll";
                $ModulePath = [System.IO.Path]::Combine($PSScriptRoot, $ExoPowershellModule);

                Import-Module $ModulePath;

                $global:_EXO_ModulePath = $ModulePath;

                $PSSession = New-ExoPSSession -ConnectionContext $ConnectionContext

                if ($PSSession -ne $null)
                {
                    if ([string]::IsNullOrEmpty($Prefix))
                    {
                        $PSSessionModuleInfo = Import-PSSession $PSSession -AllowClobber -DisableNameChecking -CommandName $CommandName -FormatTypeName $FormatTypeName
                    }
                    else
                    {
                        $PSSessionModuleInfo = Import-PSSession $PSSession -AllowClobber -DisableNameChecking -CommandName $CommandName -FormatTypeName $FormatTypeName -Prefix $Prefix
                    }
                    # Add the name of the module to clean up in case of removing the broken session
                    $PSSession | Add-Member -NotePropertyName "CurrentModuleName" -NotePropertyValue $PSSessionModuleInfo.Name

                    # Import the above module globally. This is needed as with using psm1 files, 
                    # any module which is dynamically loaded in the nested module does not reflect globally.
                    $CurrentModule = Import-Module $PSSessionModuleInfo.Path -Global -DisableNameChecking -Prefix $Prefix -PassThru
                    $CurrentModule | Add-Member -NotePropertyName "ModulePrefix" -NotePropertyValue $Prefix
                    $CurrentModule | Add-Member -NotePropertyName "CommandName" -NotePropertyValue $CommandName
                    $CurrentModule | Add-Member -NotePropertyName "FormatTypeName" -NotePropertyValue $FormatTypeName

                    UpdateImplicitRemotingHandler

                    # Import the REST module
                    $RestPowershellModule = "Microsoft.Exchange.Management.RestApiClient.dll";
                    $RestModulePath = [System.IO.Path]::Combine($PSScriptRoot, $RestPowershellModule);
                    Import-Module $RestModulePath -Cmdlet Set-ExoAppSettings;

                    $ImportedModuleName = $PSSessionModuleInfo.Name;
                }
            }
            else
            {
                # Download the new web based EXOModule
                if ($SigningCertificate -ne $null)
                {
                    $ImportedModule = New-EXOModule -ConnectionContext $ConnectionContext -SkipLoadingFormatData:$SkipLoadingFormatData -SigningCertificate $SigningCertificate;
                }
                else
                {
                    $ImportedModule = New-EXOModule -ConnectionContext $ConnectionContext -SkipLoadingFormatData:$SkipLoadingFormatData;
                }
                if ($null -ne $ImportedModule)
                {
                    $ImportedModuleName = $ImportedModule.Name;
                    $LogModuleDirectoryPath = $ImportedModule.ModuleBase

                    Write-Verbose "AutoGen EXOModule created at  $($ImportedModule.ModuleBase)"

                    if ($LoadCmdletHelp -eq $true -and $HelpFileNames -ne $null -and $HelpFileNames -is [array] -and $HelpFileNames.Count -gt 0)
                    {
                        Get-HelpFiles -HelpFileNames $HelpFileNames -ConnectionContext $ConnectionContext -ImportedModule $ImportedModule -EnableErrorReporting:$EnableErrorReporting.Value
                    }
                    else
                    {
                        $cmdletLogger.LogGenericInfo($connectionContextID, "Skipping cmdlet help data");
                    }
                }
                else
                {
                    $global:EXO_LastExecutionStatus = $false;
                    throw "Module could not be correctly formed. Please run Connect-ExchangeOnline again."
                }
            }

            # If we are configured to collect telemetry, add telemetry wrappers in case of an RPS connection
            if ($EnableErrorReporting.Value -eq $true)
            {
                if ($UseRPSSession -eq $true)
                {
                    $FilePath = Add-EXOClientTelemetryWrapper -Organization (Get-OrgNameFromUPN -UPN $UserPrincipalName.Value) -PSSessionModuleName $ImportedModuleName -LogDirectoryPath $LogDirectoryPath.Value -LogModuleDirectoryPath $LogModuleDirectoryPath
                    Write-Message("Writing telemetry records for this session to " + $FilePath[0] );
                    $global:_EXO_TelemetryFilePath = $FilePath[0]
                    Import-Module $FilePath[1] -DisableNameChecking -Global

                    Push-EXOTelemetryRecord -TelemetryFilePath $global:_EXO_TelemetryFilePath -CommandName Connect-ExchangeOnline -CommandParams $PSCmdlet.MyInvocation.BoundParameters -OrganizationName  $global:_EXO_ExPSTelemetryOrganization -ScriptName $global:_EXO_ExPSTelemetryScriptName  -ScriptExecutionGuid $global:_EXO_ExPSTelemetryScriptExecutionGuid
                }

                $endTime = Get-Date
                $cmdletLogger.LogEndTime($connectionContextID, $endTime);
                $cmdletLogger.CommitLog($connectionContextID);

                if ($EOPConnectionInProgress -eq $false)
                {
                    # Set the AppSettings
                    Set-ExoAppSettings -ShowProgress $ShowProgress.Value -PageSize $PageSize.Value -UseMultithreading $UseMultithreading.Value -TrackPerformance $TrackPerformance.Value -EnableErrorReporting $true -LogDirectoryPath $LogDirectoryPath.Value -LogLevel $LogLevel.Value
                }
            }
            else 
            {
                if ($EOPConnectionInProgress -eq $false)
                {
                    # Set the AppSettings disabling the logging
                    Set-ExoAppSettings -ShowProgress $ShowProgress.Value -PageSize $PageSize.Value -UseMultithreading $UseMultithreading.Value -TrackPerformance $TrackPerformance.Value -EnableErrorReporting $false
                }
            }
        }
        catch
        {
            # If telemetry is enabled, log errors generated from this cmdlet also.
            # If telemetry is not enabled, calls to cmdletLogger will be a no-op.
            $errorCountAtProcessEnd = $global:Error.Count 
            $numErrorRecordsToConsider = $errorCountAtProcessEnd - $errorCountAtStart
            for ($i = 0 ; $i -lt $numErrorRecordsToConsider ; $i++)
            {
                $cmdletLogger.LogGenericError($connectionContextID, $global:Error[$i]);
            }

            $cmdletLogger.CommitLog($connectionContextID);

            if ($EnableErrorReporting.Value -eq $true -and $UseRPSSession -eq $true)
            {
                if ($global:_EXO_TelemetryFilePath -eq $null)
                {
                    $global:_EXO_TelemetryFilePath = New-EXOClientTelemetryFilePath -LogDirectoryPath $LogDirectoryPath.Value

                    # Import the REST module
                    $RestPowershellModule = "Microsoft.Exchange.Management.RestApiClient.dll";
                    $RestModulePath = [System.IO.Path]::Combine($PSScriptRoot, $RestPowershellModule);
                    Import-Module $RestModulePath -Cmdlet Set-ExoAppSettings;

                    # Set the AppSettings
                    Set-ExoAppSettings -ShowProgress $ShowProgress.Value -PageSize $PageSize.Value -UseMultithreading $UseMultithreading.Value -TrackPerformance $TrackPerformance.Value -ConnectionUri $ConnectionUri -EnableErrorReporting $true -LogDirectoryPath $LogDirectoryPath.Value -LogLevel $LogLevel.Value
                }

                # Log errors which are encountered during Connect-ExchangeOnline execution. 
                Write-Message ("Writing Connect-ExchangeOnline error log to " + $global:_EXO_TelemetryFilePath)
                Push-EXOTelemetryRecord -TelemetryFilePath $global:_EXO_TelemetryFilePath -CommandName Connect-ExchangeOnline -CommandParams $PSCmdlet.MyInvocation.BoundParameters -OrganizationName  $global:_EXO_ExPSTelemetryOrganization -ScriptName $global:_EXO_ExPSTelemetryScriptName  -ScriptExecutionGuid $global:_EXO_ExPSTelemetryScriptExecutionGuid -ErrorObject $global:Error -ErrorRecordsToConsider ($errorCountAtProcessEnd - $errorCountAtStart) 
            }

            $global:EXO_LastExecutionStatus = $false;

            if ($_.Exception -ne $null)
            {
                # Connect-ExchangeOnline Failed, Remove ConnectionContext from Map.
                if ([Microsoft.Exchange.Management.ExoPowershellSnapin.ConnectionContextFactory]::RemoveConnectionContextUsingConnectionId($connectionContextID))
                {
                    Write-Verbose "ConnectionContext Removed"
                }

                if ($_.Exception.InnerException -ne $null)
                {
                    throw $_.Exception.InnerException;
                }
                else
                {
                    throw $_.Exception;
                }
            }
            else
            {
                throw $_;
            }
        }
    }
}

function Connect-IPPSSession
{
    [CmdletBinding()]
    param(
        # Connection Uri for the Remote PowerShell endpoint
        [string] $ConnectionUri = 'https://ps.compliance.protection.outlook.com/PowerShell-LiveId',

        # Azure AD Authorization endpoint Uri that can issue the OAuth2 access tokens
        [string] $AzureADAuthorizationEndpointUri = 'https://login.microsoftonline.com/organizations',

        # Delegated Organization Name
        [string] $DelegatedOrganization = '',

        # PowerShell session options to be used when opening the Remote PowerShell session
        [System.Management.Automation.Remoting.PSSessionOption] $PSSessionOption = $null,

        # Switch to bypass use of mailbox anchoring hint.
        [switch] $BypassMailboxAnchoring = $false,

        # Prefix 
        [string] $Prefix = '',

        #Cmdlets to Import, by default it would bring all
        [string[]] $CommandName = @("*"),

        #The way the output objects would be printed on the console
        [string[]] $FormatTypeName = @("*"),

        # Use Remote PowerShell Session based connection
        [switch] $UseRPSSession = $false,

        # Show Banner of scc cmdlets Mapping and recent updates
        [switch] $ShowBanner = $true,

        # switch to disable WAM
        [switch] $DisableWAM = $false,

        # Externally provided access token
        [string] $AccessToken = '',
        
        # Switch to using OBO Token
        [switch] $EnableSearchOnlySession = $false
    )
    DynamicParam
    {
        if (($isCloudShell = IsCloudShellEnvironment) -eq $false)
        {
            $attributes = New-Object System.Management.Automation.ParameterAttribute
            $attributes.Mandatory = $false

            $attributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $attributeCollection.Add($attributes)

            # User Principal Name or email address of the user
            $UserPrincipalName = New-Object System.Management.Automation.RuntimeDefinedParameter('UserPrincipalName', [string], $attributeCollection)
            $UserPrincipalName.Value = ''

            # User Credential to Logon
            $Credential = New-Object System.Management.Automation.RuntimeDefinedParameter('Credential', [System.Management.Automation.PSCredential], $attributeCollection)
            $Credential.Value = $null

            # Certificate
            $Certificate = New-Object System.Management.Automation.RuntimeDefinedParameter('Certificate', [System.Security.Cryptography.X509Certificates.X509Certificate2], $attributeCollection)
            $Certificate.Value = $null

            # Certificate Path 
            $CertificateFilePath = New-Object System.Management.Automation.RuntimeDefinedParameter('CertificateFilePath', [string], $attributeCollection)
            $CertificateFilePath.Value = ''

            # Certificate Password
            $CertificatePassword = New-Object System.Management.Automation.RuntimeDefinedParameter('CertificatePassword', [System.Security.SecureString], $attributeCollection)
            $CertificatePassword.Value = $null

            # Certificate Thumbprint
            $CertificateThumbprint = New-Object System.Management.Automation.RuntimeDefinedParameter('CertificateThumbprint', [string], $attributeCollection)
            $CertificateThumbprint.Value = ''

            # Application Id
            $AppId = New-Object System.Management.Automation.RuntimeDefinedParameter('AppId', [string], $attributeCollection)
            $AppId.Value = ''

            # Organization
            $Organization = New-Object System.Management.Automation.RuntimeDefinedParameter('Organization', [string], $attributeCollection)
            $Organization.Value = ''

            # Switch to collect telemetry on command execution. 
            $EnableErrorReporting = New-Object System.Management.Automation.RuntimeDefinedParameter('EnableErrorReporting', [switch], $attributeCollection)
            $EnableErrorReporting.Value = $false
            
            # Where to store command telemetry data. By default telemetry is stored in the directory "%TEMP%/EXOTelemetry" in the file : EXOCmdletTelemetry-yyyymmdd-hhmmss.csv.
            $LogDirectoryPath = New-Object System.Management.Automation.RuntimeDefinedParameter('LogDirectoryPath', [string], $attributeCollection)
            $LogDirectoryPath.Value = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "EXOCmdletTelemetry")
            # Create a new attribute and valiate set against the LogLevel
            $LogLevelAttribute = New-Object System.Management.Automation.ParameterAttribute
            $LogLevelAttribute.Mandatory = $false
            $LogLevelAttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $LogLevelAttributeCollection.Add($LogLevelAttribute)
            $LogLevelList = @([Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel]::Default, [Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel]::All)
            $ValidateSet = New-Object System.Management.Automation.ValidateSetAttribute($LogLevelList)
            $LogLevel = New-Object System.Management.Automation.RuntimeDefinedParameter('LogLevel', [Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel], $LogLevelAttributeCollection)
            $LogLevel.Attributes.Add($ValidateSet)

            $paramDictionary = New-object System.Management.Automation.RuntimeDefinedParameterDictionary
            $paramDictionary.Add('UserPrincipalName', $UserPrincipalName)
            $paramDictionary.Add('Credential', $Credential)
            $paramDictionary.Add('Certificate', $Certificate)
            $paramDictionary.Add('CertificateFilePath', $CertificateFilePath)
            $paramDictionary.Add('CertificatePassword', $CertificatePassword)
            $paramDictionary.Add('AppId', $AppId)
            $paramDictionary.Add('Organization', $Organization)
            $paramDictionary.Add('EnableErrorReporting', $EnableErrorReporting)
            $paramDictionary.Add('LogDirectoryPath', $LogDirectoryPath)
            $paramDictionary.Add('LogLevel', $LogLevel)
            if($PSEdition -eq 'Core')
            {
                # We do not want to expose certificate thumprint in Linux as it is not feasible there.
                if($IsWindows)
                {
                    $paramDictionary.Add('CertificateThumbprint', $CertificateThumbprint);
                }
            }
            else 
            {
                $paramDictionary.Add('CertificateThumbprint', $CertificateThumbprint);
            }

            return $paramDictionary
        }
        else
        {
            $attributes = New-Object System.Management.Automation.ParameterAttribute
            $attributes.Mandatory = $false

            $attributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $attributeCollection.Add($attributes)

            # Switch to MSI auth 
            $Device = New-Object System.Management.Automation.RuntimeDefinedParameter('Device', [switch], $attributeCollection)
            $Device.Value = $false

            # Switch to collect telemetry on command execution. 
            $EnableErrorReporting = New-Object System.Management.Automation.RuntimeDefinedParameter('EnableErrorReporting', [switch], $attributeCollection)
            $EnableErrorReporting.Value = $false
            
            # Where to store EXO command telemetry data. By default telemetry is stored in the directory "%TEMP%/EXOTelemetry" in the file : EXOCmdletTelemetry-yyyymmdd-hhmmss.csv.
            $LogDirectoryPath = New-Object System.Management.Automation.RuntimeDefinedParameter('LogDirectoryPath', [string], $attributeCollection)
            $LogDirectoryPath.Value = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "EXOCmdletTelemetry")
            # Create a new attribute and validate set against the LogLevel
            $LogLevelAttribute = New-Object System.Management.Automation.ParameterAttribute
            $LogLevelAttribute.Mandatory = $false
            $LogLevelAttributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
            $LogLevelAttributeCollection.Add($LogLevelAttribute)
            $LogLevelList = @([Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel]::Default, [Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel]::All)
            $ValidateSet = New-Object System.Management.Automation.ValidateSetAttribute($LogLevelList)
            $LogLevel = New-Object System.Management.Automation.RuntimeDefinedParameter('LogLevel', [Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel], $LogLevelAttributeCollection)
            $LogLevel.Attributes.Add($ValidateSet)
            $paramDictionary = New-object System.Management.Automation.RuntimeDefinedParameterDictionary
            $paramDictionary.Add('Device', $Device)
            $paramDictionary.Add('EnableErrorReporting', $EnableErrorReporting)
            $paramDictionary.Add('LogDirectoryPath', $LogDirectoryPath)
            $paramDictionary.Add('LogLevel', $LogLevel)
            return $paramDictionary
        }
    }
    process 
    {
        try
        {
            $EOPConnectionInProgress = $true
            Set-Variable -Name "EnableSearchOnlySession" -Value $EnableSearchOnlySession.IsPresent -Scope Script
            if ($isCloudShell -eq $false)
            {
                $LogLevelValue = [Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.LogLevel]::All
                if($LogLevel.Value)
                {
                    $LogLevelValue = $LogLevel.Value
                }
                $certThumbprint = $CertificateThumbprint.Value
                # Will pass CertificateThumbprint if it is not null or not empty
                if($certThumbprint)
                {
                    Connect-ExchangeOnline -ConnectionUri $ConnectionUri -AzureADAuthorizationEndpointUri $AzureADAuthorizationEndpointUri -UserPrincipalName $UserPrincipalName.Value -PSSessionOption $PSSessionOption -Credential $Credential.Value -BypassMailboxAnchoring:$BypassMailboxAnchoring -ShowBanner:$ShowBanner -DelegatedOrganization $DelegatedOrganization -Certificate $Certificate.Value -CertificateFilePath $CertificateFilePath.Value -CertificatePassword $CertificatePassword.Value -CertificateThumbprint $certThumbprint -AppId $AppId.Value -Organization $Organization.Value -Prefix $Prefix -CommandName $CommandName -FormatTypeName $FormatTypeName -UseRPSSession:$UseRPSSession -DisableWAM:$DisableWAM -EnableErrorReporting:$EnableErrorReporting.Value -LogLevel $LogLevelValue -LogDirectoryPath $LogDirectoryPath.Value
                }
                else
                {
                    Connect-ExchangeOnline -ConnectionUri $ConnectionUri -AzureADAuthorizationEndpointUri $AzureADAuthorizationEndpointUri -UserPrincipalName $UserPrincipalName.Value -PSSessionOption $PSSessionOption -Credential $Credential.Value -BypassMailboxAnchoring:$BypassMailboxAnchoring -ShowBanner:$ShowBanner -DelegatedOrganization $DelegatedOrganization -Certificate $Certificate.Value -CertificateFilePath $CertificateFilePath.Value -CertificatePassword $CertificatePassword.Value -AppId $AppId.Value -Organization $Organization.Value -Prefix $Prefix -CommandName $CommandName -FormatTypeName $FormatTypeName -UseRPSSession:$UseRPSSession -DisableWAM:$DisableWAM -AccessToken $AccessToken -EnableErrorReporting:$EnableErrorReporting.Value -LogLevel $LogLevelValue -LogDirectoryPath $LogDirectoryPath.Value
                }
            }
            else
            {
                Connect-ExchangeOnline -ConnectionUri $ConnectionUri -AzureADAuthorizationEndpointUri $AzureADAuthorizationEndpointUri -PSSessionOption $PSSessionOption -BypassMailboxAnchoring:$BypassMailboxAnchoring -Device:$Device.Value -ShowBanner:$ShowBanner -DelegatedOrganization $DelegatedOrganization -Prefix $Prefix -CommandName $CommandName -FormatTypeName $FormatTypeName -UseRPSSession:$UseRPSSession -DisableWAM:$DisableWAM -AccessToken $AccessToken -EnableErrorReporting:$EnableErrorReporting.Value -LogLevel $LogLevelValue -LogDirectoryPath $LogDirectoryPath.Value
            }
        }
        finally
        {
            $EOPConnectionInProgress = $false
        }
    }
}

function Disconnect-ExchangeOnline
{
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='High', DefaultParameterSetName='DefaultParameterSet')]
    param(
        [Parameter(Mandatory=$true, ParameterSetName='ConnectionId', ValueFromPipelineByPropertyName=$true)]
        [string[]] $ConnectionId,
        [Parameter(Mandatory=$true, ParameterSetName='ModulePrefix')]
        [string[]] $ModulePrefix
    )

    process
    {
        $global:EXO_LastExecutionStatus = $true;
        $disconnectConfirmationMessage = ""
        Switch ($PSCmdlet.ParameterSetName)
        {
            'ConnectionId'
            {
                $disconnectConfirmationMessage = [Microsoft.Exchange.Management.ExoPowershellSnapin.ConnectionContextFactory]::GetDisconnectConfirmationMessageByConnectionId($ConnectionId)
                break
            }
            'ModulePrefix'
            {
                $disconnectConfirmationMessage = [Microsoft.Exchange.Management.ExoPowershellSnapin.ConnectionContextFactory]::GetDisconnectConfirmationMessageByModulePrefix($ModulePrefix)
                break
            }
            Default
            {
                $disconnectConfirmationMessage = [Microsoft.Exchange.Management.ExoPowershellSnapin.ConnectionContextFactory]::GetDisconnectConfirmationMessageWithInbuilt()
            }
        }
	
        if ($PSCmdlet.ShouldProcess(
            $disconnectConfirmationMessage,
            "Press(Y/y/A/a) if you want to continue.",
            $disconnectConfirmationMessage))
        {

            # Keep track of error count at beginning.
            $errorCountAtStart = $global:Error.Count;
            $startTime = Get-Date

            try
            {
                # Get all the connection contexts so that the logger can be initialized.
                $connectionContexts = [Microsoft.Exchange.Management.ExoPowershellSnapin.ConnectionContextFactory]::GetAllConnectionContexts()
                $disconnectCmdletId = [System.Guid]::NewGuid().ToString()

                # denotes if any of the connections is an RPS session.
                # This is used to Push-EXOTelemetryRecord in case any RPS connections are present.
                $rpsConnectionWithErrorReportingExists = $false
                
                foreach ($context in $connectionContexts)
                {
                    $context.Logger.InitLog($disconnectCmdletId);
                    $context.Logger.LogStartTime($disconnectCmdletId, $startTime);
                    $context.Logger.LogCmdletName($disconnectCmdletId, "Disconnect-ExchangeOnline");
                    if ($context.IsRpsSession -and $context.ErrorReportingEnabled)
                    {
                        $rpsConnectionWithErrorReportingExists = $true
                    }
                }

                # Import the module once more to ensure that Test-ActiveToken is present
                $ExoPowershellModule = "Microsoft.Exchange.Management.ExoPowershellGalleryModule.dll";
                $ModulePath = [System.IO.Path]::Combine($PSScriptRoot, $ExoPowershellModule);
                Import-Module $ModulePath -Cmdlet Clear-ActiveToken;

                $existingPSSession = Get-PSSession | Where-Object {$_.ConfigurationName -like "Microsoft.Exchange" -and $_.Name -like "ExchangeOnlineInternalSession*"}

                if ($existingPSSession.count -gt 0) 
                {
                    for ($index = 0; $index -lt $existingPSSession.count; $index++)
                    {
                        $session = $existingPSSession[$index]
                        Remove-PSSession -session $session

                        Write-Information "Removed the PSSession $($session.Name) connected to $($session.ComputerName)"

                        # Remove any active access token from the cache
                        # If the connectionId of the session being cleared is equal to AppSettings.ConnectionId, this means connection to EXO cmdlets will break.
                        if ($session.ConnectionContext.ConnectionId -ieq [Microsoft.Exchange.Management.AdminApiProvider.AppSettings]::ConnectionId)
                        {
                            Clear-ActiveToken -TokenProvider $session.TokenProvider -IsSessionUsedByInbuiltCmdlets:$true
                        }
                        else
                        {
                            Clear-ActiveToken -TokenProvider $session.TokenProvider -IsSessionUsedByInbuiltCmdlets:$false
                        }

                        # Remove any previous modules loaded because of the current PSSession
                        if ($session.PreviousModuleName -ne $null)
                        {
                            if ((Get-Module $session.PreviousModuleName).Count -ne 0)
                            {
                                $null = Remove-Module -Name $session.PreviousModuleName -ErrorAction SilentlyContinue
                            }

                            $session.PreviousModuleName = $null
                        }

                        # Remove any leaked module in case of removal of broken session object
                        if ($session.CurrentModuleName -ne $null)
                        {
                            if ((Get-Module $session.CurrentModuleName).Count -ne 0)
                            {
                                $null = Remove-Module -Name $session.CurrentModuleName -ErrorAction SilentlyContinue
                            }
                        }
                    }
                }

                $modulesToRemove = $null
                Switch ($PSCmdlet.ParameterSetName)
                {
                    'ConnectionId'
                    {
                        # Call GetModulesToRemoveByConnectionId in this scenario
                        $modulesToRemove = [Microsoft.Exchange.Management.ExoPowershellSnapin.ConnectionContextFactory]::GetModulesToRemoveByConnectionId($ConnectionId)
                        break
                    }
                    'ModulePrefix'
                    {
                        # Call GetModulesToRemoveByModulePrefix in this scenario
                        $modulesToRemove = [Microsoft.Exchange.Management.ExoPowershellSnapin.ConnectionContextFactory]::GetModulesToRemoveByModulePrefix($ModulePrefix)
                        break
                    }
                    Default
                    {
                        # Remove all the AutoREST modules from this instance of powershell if created
                        $existingAutoRESTModules = Get-Module "tmpEXO_*"
                        foreach ($module in $existingAutoRESTModules)
                        {  
                            $null = Remove-Module -Name $module -ErrorAction SilentlyContinue
                        }

                        # The below call to remove all connection contexts could be removed as we already have an OnRemove event hooked to the module. Work Item 3461604 to investigate this
                        # Remove all ConnectionContexts
                        # this internally clears all the active tokens in ConnectionContexts
                        [Microsoft.Exchange.Management.ExoPowershellSnapin.ConnectionContextFactory]::RemoveAllConnectionContexts()
                    }
                }

                if ($modulesToRemove -ne $null -and $modulesToRemove.Count -gt 0)
                {
                    $null = Remove-Module $modulesToRemove -ErrorAction SilentlyContinue
                }

                Write-Information "Disconnected successfully !"

                # Remove all the Wrapped modules from this instance of powershell if created
                $existingWrappedModules = Get-Module "EXOCmdletWrapper-*"
                foreach ($module in $existingWrappedModules)
                {
                    $null = Remove-Module -Name $module -ErrorAction SilentlyContinue
                }

                if ($rpsConnectionWithErrorReportingExists)
                {
                    if ($global:_EXO_TelemetryFilePath -eq $null)
                    {
                        $global:_EXO_TelemetryFilePath = New-EXOClientTelemetryFilePath
                    }

                    Push-EXOTelemetryRecord -TelemetryFilePath $global:_EXO_TelemetryFilePath -CommandName Disconnect-ExchangeOnline -CommandParams $PSCmdlet.MyInvocation.BoundParameters -OrganizationName  $global:_EXO_ExPSTelemetryOrganization -ScriptName $global:_EXO_ExPSTelemetryScriptName  -ScriptExecutionGuid $global:_EXO_ExPSTelemetryScriptExecutionGuid
                }
            }
            catch
            {
                # If telemetry is enabled for any of the connections, log errors generated from this cmdlet also. 
                $errorCountAtProcessEnd = $global:Error.Count
                $global:EXO_LastExecutionStatus = $false;
                
                $endTime = Get-Date
                foreach ($context in $connectionContexts)
                {
                    $numErrorRecordsToConsider = $errorCountAtProcessEnd - $errorCountAtStart
                    for ($i = 0 ; $i -lt $numErrorRecordsToConsider ; $i++)
                    {
                        $context.Logger.LogGenericError($disconnectCmdletId, $global:Error[$i]);
                    }

                    $context.Logger.LogEndTime($disconnectCmdletId, $endTime);
                    $context.Logger.CommitLog($disconnectCmdletId);
                    $logFilePath = $context.Logger.GetCurrentLogFilePath();
                }

                if ($rpsConnectionWithErrorReportingExists)
                {
                    if ($global:_EXO_TelemetryFilePath -eq $null)
                    {
                        $global:_EXO_TelemetryFilePath = New-EXOClientTelemetryFilePath
                    }

                    # Log errors which are encountered during Disconnect-ExchangeOnline execution. 
                    Write-Message ("Writing Disconnect-ExchangeOnline errors to " + $global:_EXO_TelemetryFilePath)

                    Push-EXOTelemetryRecord -TelemetryFilePath $global:_EXO_TelemetryFilePath -CommandName Disconnect-ExchangeOnline -CommandParams $PSCmdlet.MyInvocation.BoundParameters -OrganizationName  $global:_EXO_ExPSTelemetryOrganization -ScriptName $global:_EXO_ExPSTelemetryScriptName  -ScriptExecutionGuid $global:_EXO_ExPSTelemetryScriptExecutionGuid -ErrorObject $global:Error -ErrorRecordsToConsider ($errorCountAtProcessEnd - $errorCountAtStart) 
                }

                throw $_
            }

            $endTime = Get-Date
            foreach ($context in $connectionContexts)
            {
                if ($context.Logger -ne $null)
                {
                    $context.Logger.LogEndTime($disconnectCmdletId, $endTime);
                    $context.Logger.CommitLog($disconnectCmdletId);
                }
            }
        }
    }
}

# SIG # Begin signature block
