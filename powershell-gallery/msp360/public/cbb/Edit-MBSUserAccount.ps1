function Edit-MBSUserAccount {
   <#
    .SYNOPSIS
    Edit MBS user account.
    
    .DESCRIPTION
    The cmdlet edits MBS user account by specifying MBS user credentials or with simple Windows authentication mode.
    
    .PARAMETER User
    MBS User account name
    
    .PARAMETER Password
    MBS User account password

    .PARAMETER SSL
    Use SSL for user backup storages. 

    .PARAMETER BackupPrefix
    Set different backup prefix for computer 
    
    .PARAMETER WindowsAuth
    Use Windows authorization

    .PARAMETER DomainOnly
    Don't use Windows Auth if user is not in the domain
    
    .PARAMETER WindowsAuthDirectMode
    Use Windows authorization (direct mode)
    
    .PARAMETER ADBridgeEndpoint
    Active Directory Bridge endpoint
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .EXAMPLE
    PS C:\> Edit-MBSUserAccount -User backupuser -Password (ConvertTo-SecureString -string 'My_Password' -AsPlainText -Force)

    Edit MBS backup user credentials.
    
    .EXAMPLE
    PS C:\> Edit-MBSUserAccount -User backupuser -Password (ConvertTo-SecureString -string 'My_Password' -AsPlainText -Force) -SSL $false

    Edit MBS backup user account and disable using SSL for backup storages.

    .EXAMPLE
    PS C:\> Edit-MBSUserAccount -WindowsAuth -ADBridgeEndpoint http://ADBRIDGE-PC:8900/ADGateway/Service/

    Login using Windows authentication.

    .EXAMPLE
    PS C:\> Edit-MBSUserAccount -WindowsAuthD

    Login using Windows authentication in direct mode.

    .EXAMPLE
    PS C:\> Edit-MBSUserAccount -WindowsAuthD

    Login using Windows authentication in direct mode.

    .EXAMPLE
    PS C:\> Edit-MBSUserAccount -BackupPrefix SamplePrefix

    Change backup prefix to the specified one

    .INPUTS
        None

    .OUTPUTS
        String

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/edit-mbsuseraccount
    #>
    
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="MBS User account name", ParameterSetName='MBSUser')]
        [String]
        $User,
        [Parameter(Mandatory=$true, HelpMessage="MBS User account password. Use -Password (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='MBSUser')]
        [SecureString]
        $Password,
        [Parameter(Mandatory=$false, HelpMessage="Use SSL.", ParameterSetName='MBSUser')]
        [Nullable[boolean]]
        $SSL,
        [Parameter(Mandatory=$false, HelpMessage="Specify Backup prefix", ParameterSetName='MBSUser')]
        [Parameter(Mandatory=$false, HelpMessage="Specify Backup prefix", ParameterSetName='WindowsAuth')]
        [Parameter(Mandatory=$false, HelpMessage="Specify Backup prefix", ParameterSetName='WindowsAuthDirectMode')]
        [String]
        $BackupPrefix,
        [Parameter(Mandatory=$true, HelpMessage="Use Windows authorization", ParameterSetName='WindowsAuth')]
        [Switch]
        $WindowsAuth,
        [Parameter(Mandatory=$false, HelpMessage="Don't use Windows Auth if user is not in the domain", ParameterSetName='WindowsAuth')]
        [Switch]
        $DomainOnly,
        [Parameter(Mandatory=$false, HelpMessage="Use Windows authorization (direct mode)", ParameterSetName='WindowsAuthDirectMode')]
        [Switch]
        $WindowsAuthDirectMode,
        [Parameter(Mandatory=$true, HelpMessage="Active Directory Bridge endpoint", ParameterSetName='WindowsAuth')]
        [String]
        $ADBridgeEndpoint,
        # Parameter - Master password
        [Parameter(Mandatory=$false, HelpMessage="Specify Master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $MasterPassword
    )
    
    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
        if (-Not(Test-MBSAgentMasterPassword)) {
            $MasterPassword = $null
        } else {
            if (-Not(Test-MBSAgentMasterPassword -CheckMasterPassword -MasterPassword $MasterPassword)) {
                $MasterPassword = Read-Host -AsSecureString -Prompt "Master Password"
                if (-Not(Test-MBSAgentMasterPassword -CheckMasterPassword -MasterPassword $MasterPassword)) {
                    Write-Error "ERROR: Master password is not specified"
                    Break
                }
            }
        }
    }
    
    process {
        function Set-Argument {
            if ($User){$Argument += " -e $User"}
            if ($Password){$Argument += " -p """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)))+""""}
            if ($BackupPrefix){$Argument += " -bp $BackupPrefix"}
            if ($WindowsAuth){$Argument += " -winauth"}
            if ($DomainOnly){$Argument += " -domainOnly"}
            if ($null -ne $SSL){
                if ($SSL) {
                    $Argument += " -ssl yes"
                }else{
                    $Argument += " -ssl no"
                }
            }
            if ($WindowsAuthDirectMode){$Argument += " -winauthD"}
            if ($ADBridgeEndpoint){$Argument += " -adep $ADBridgeEndpoint"}
                
            return $Argument
        }

        $Arguments = 'editaccount'
        $Arguments += Set-Argument

        $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword
    }
    
    end {
        
    }
}

# SIG # Begin signature block
