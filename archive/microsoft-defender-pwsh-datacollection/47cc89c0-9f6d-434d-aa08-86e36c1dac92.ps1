# Remove pre loaded modules to mitigate exploit
Get-Module -ErrorAction SilentlyContinue | ForEach-Object { Remove-Module -Name $_.Name -Force -ErrorAction SilentlyContinue }
$PSModuleAutoloadingPreference = 'none'

if($ExecutionContext.SessionState.LanguageMode -eq "ConstrainedLanguage")
{
    Write-Host "Powershell is in constrained language mode"
    exit
}

try
{
    # The order of importing module is imporatnt
    Import-Module -Name 'Microsoft.PowerShell.Utility' -ErrorAction Stop
    Import-Module -Name 'Microsoft.PowerShell.Management' -ErrorAction Stop
    Import-Module -Name 'Microsoft.PowerShell.Diagnostics' -ErrorAction Stop
    Import-Module -Name 'Microsoft.PowerShell.Security' -ErrorAction Stop
    Import-Module -Name 'CimCmdlets' -ErrorAction Stop
}
catch
{
    Write-Host "Cannot load required modules: $($_.Exception.Message)"
    exit
}

function Validate-TargetOrg
{
    $OrgIdList = @(
    "73a6cfebab296728e1e03437412d845a695dbd9f1bb835bb4a74c78e5feb71dd",
    "5a03ab1d2c507a5e4d75b8bc75ae40de185a32024d94c1d78acb36ab6fa45ca8",
    "4e09d271db066fc048ddf25a7345e4a709241d614e08d90bef62e3a53163cbf7",
    "b20a108ac88696856879620a4f3c2653680ea6224b6e058c841ed6cfb65c6096",
    "8f2e5b6d79094f6677e5efa8a2aafc6c8f95891ed7f7a340612918fa04356719"
    )

    $RegistryOnboardedInfo = Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\Microsoft\Windows Advanced Threat Protection" -Name OnboardedInfo -ErrorAction Stop
    $OrgId = $RegistryOnboardedInfo | ConvertFrom-Json -ErrorAction Stop| Select-Object -ExpandProperty body | ConvertFrom-Json -ErrorAction Stop | Select-Object -ExpandProperty orgId
    if([string]::IsNullOrEmpty($OrgId))
    {
        return $true
    }

    $StringBuffer = [System.Text.Encoding]::Unicode.GetBytes($OrgId)
    $StringBuilder = New-Object System.Text.StringBuilder 
    [System.Security.Cryptography.HashAlgorithm]::Create("Sha256").ComputeHash($StringBuffer) | %{ [Void]$StringBuilder.Append($_.ToString("x2"))} 
    $Hashed = $StringBuilder.ToString()
    return $OrgIdList -contains $Hashed
}

# Validate target
try
{
    if(!(Validate-TargetOrg))
    {
        Write-Host "Not target org"
        exit
    }
}
catch
{
    Write-Host "Validate target error. At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
}

## ## Global CONSTS ## ##
try
{
    $global:Win32UserProfiles = Get-CimInstance Win32_UserProfile -ErrorAction Stop | Select-Object SID,Special,Loaded,LastUseTime,LocalPath
}
catch
{
    Write-Host "Canont get Win32_UserProfile. At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    exit
}

function Check-PatchedDotNetVersion
{
    $DotNetV4Path = 'HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full'

    # No .Net 4.X; no patched version
    if (-not (Test-Path $DotNetV4Path))
    {
        return $false
    }

    if ([System.Environment]::OSVersion.Version.Build -eq 10240)
    {
        # Windows 10 1507
        return $false
    }

    $FrameworkVersionV4 = Get-ItemPropertyValue -LiteralPath $DotNetV4Path -Name Release
    $DotNetV4RuntimeVersion = [version](Get-ChildItem "$([System.Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory())\clr.dll").VersionInfo.ProductVersion

    # 4.8.1
    if ($FrameworkVersionV4 -in @(533320, 533325))
    {
        return $DotNetV4RuntimeVersion -ge [version]"4.8.9300.0"
    }

    # 4.8
    if ($FrameworkVersionV4 -in @(528040, 528372, 528449, 528049))
    {
        return $DotNetV4RuntimeVersion -ge [version]"4.8.4780.0"
    }

    return $false
}

function Check-OlderDotNetVersions
{
    if ((Test-Path "$env:windir\Microsoft.NET\Framework\v2.0.50727\mscorwks.dll") -or
        (Test-Path "$env:windir\Microsoft.NET\Framework\v1.0.3705\mscoree.dll") -or
        (Test-Path "$env:windir\Microsoft.NET\Framework\v1.1.4322\mscoree.dll"))
    {
        return $true
    }

    return $false
}

$global:StartCpu = Get-CimInstance -class win32_processor -ErrorAction SilentlyContinue | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average
$global:StartTime = Get-Date
$global:GuidRegexPattern = "\{([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})\}"
$global:ExpectedAssemblyExtension = ".dll"
$global:MaximumAllowedMemory = 350 # MB
$global:MaximunMinutes = 7
$global:MaxComObjects = 5000
$global:MaxDependencyLevel = 5
$global:MaxLastLogonTimeOfUsersToSearch = $global:StartTime.AddDays(-30)
$global:MaxLoggedOffUsersToTake = 10
$global:COMKey = "HasConflictingCOMObjects"
$global:PowershellKey = "PowershellPolicyCanConflict"
$global:ControlKey = "AllowWdacControls"
$global:RegistryPath = "HKLM:\SOFTWARE\Microsoft\SenseDDC\ImmuneWdacInfo"
$global:COMDllName = "mscoree.dll"
$global:AssemblyExtractionRegex = "\s[`'`"]([\S\s]+)[`"`']\s"
$global:AssemblyExtractionRegexFallback = "([0-9a-zA-Z\.]+, Version=[\d\.]+, Culture=[a-zA-Z\-]+, PublicKeyToken=(?:[a-f0-9]{16}|null))"
$global:OffregDllPath = "$env:windir\System32\offreg.dll"
$global:OffregDllCertificateSubject = "CN=Microsoft Windows, O=Microsoft Corporation, L=Redmond, S=Washington, C=US"
$global:AppDataFilePath = "AppData\Local\Microsoft\Windows\UsrClass.DAT"
$global:GACv4Path = "$env:windir\Microsoft.NET\Assembly\GAC"
$global:GACv2Path = "$env:windir\Assembly\GAC"
$global:HasPatchedDotNetVersion = Check-PatchedDotNetVersion
$global:HasOlderDotNetVersion = Check-OlderDotNetVersions
## ## ## ## ## ## ## ##

# Checkes the currect device performance state and returns whether we can continue execution or not.
function Check-PerformanceState
{
    $CurrentTime = Get-Date
    $TotalMinutesUntilNow = New-TimeSpan -Start $global:StartTime -End $CurrentTime | Select-Object -ExpandProperty TotalMinutes
    if($TotalMinutesUntilNow -gt $global:MaximunMinutes)
    {
        Write-Host "Exceeded maximum allowed time: $TotalMinutesUntilNow"
        return $false
    }

    try
    {
        $CurrentProcessInfo = Get-Process -Id $PID -ErrorAction Stop
        $CurrentProcessWorkingSetSize = $CurrentProcessInfo.WS / 1024 / 1024
        if($CurrentProcessWorkingSetSize -gt $global:MaximumAllowedMemory)
        {
            Write-Host "Exceeded maximum allowed memory: $CurrentProcessWorkingSetSize"
            return $false
        }
    }
    catch
    {
        Write-Host "Canont get performance info. At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
        return $false
    }

    return $true
}

function Get-DeviceGuardStatus
{
    try
    {
        $Status = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard -ErrorAction Stop | Select-Object -ExpandProperty UsermodeCodeIntegrityPolicyEnforcementStatus
        switch ($Status) 
        {
            0 { return "NotConfigured" }
            1 { return "Audit" }
            2 { return "Enforced" }
            default { return "Unknown" }
        }
    }
    catch
    {
        Write-Host "Canont get DeviceGuard status. At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
        return $null
    }
}

function Get-DotNetCOMPlusEnvironmentVariable
{
    # .NET checks this Env variable to know whether the CLR should validate CLSIDs
    # if the value is 1, the CLS checks the CLSIDs on every loaded dll
    return $Env:COMPlus_CheckCOMObjectCLSID
}

# Validate that the target library file exist on local disk and it has .dll extension
function Get-ValidLibraryFilePath
{
    param([string]$FilePath)
    
    if([string]::IsNullOrEmpty($FilePath))
    {
        return $null
    }

    [uri]$ParsedUri = $null
    if([uri]::TryCreate($FilePath, [urikind]::Absolute, [ref]$ParsedUri))
    {
        if($ParsedUri.IsFile -and [string]::IsNullOrEmpty($ParsedUri.Host) -and ![string]::IsNullOrEmpty($ParsedUri.LocalPath) -and $ParsedUri.LocalPath.EndsWith($global:ExpectedAssemblyExtension, [System.StringComparison]::OrdinalIgnoreCase))
        {
            return $ParsedUri.LocalPath
        }
    }

    return $null
}

# Get all the com objects registry full path with "Registry::" prefix
function Get-AllCOMObjectsRegistryPaths
{
    $AllCOMObjects = New-Object -TypeName 'System.Collections.Generic.HashSet[string]'
    [string[]]$LocalMachine = Get-LocalMachineCOMObjects
    if($LocalMachine -ne $null -and $LocalMachine.Count -gt 0)
    {
        $AllCOMObjects.UnionWith($LocalMachine)
    }

    [string[]]$LocalUsers = Get-UsersCOMObjects
    if($LocalUsers -ne $null -and $LocalUsers.Count -gt 0)
    {
        $AllCOMObjects.UnionWith($LocalUsers)
    }

    return $AllCOMObjects
}

# Extract the first group from a string using regex pattern
function Extract-Regex
{
    param(
    [Parameter(Mandatory=$true)]
    [string]$Data,
    [Parameter(Mandatory=$true)]
    [string]$RegexPattern)

    try
    {
        $RegexResult = [regex]::Match($Data, $RegexPattern)
        if($RegexResult.Success -and $RegexResult.Groups.Count -gt 1)
        {
            return $RegexResult.Groups[1].Value
        }
    }
    catch
    {
    }

    return $null
}

# Get all the registred COM objects information on this device
function Get-AllCOMObjectsInfo
{
    param([string[]]$RegistryPaths)

    $COMObjectInfoList = [System.Collections.ArrayList]@()   
    foreach($RegistryPath in $RegistryPaths)
    {
        # Extract all the relevant info from the registry
        try
        {
            $Key = Get-Item -LiteralPath $RegistryPath -ErrorAction Stop
            $ComponentID = Extract-Regex -Data $RegistryPath -RegexPattern $global:GuidRegexPattern
            if([string]::IsNullOrEmpty($ComponentID))
            {
                $ScrubbedPath = $RegistryPath
                if($ScrubbedPath -like "Registry::HKEY_USERS\S-1-12-1-*-*-*-*\*")
                {
                    # Remove the Sid part
                    $FirstIndex = $ScrubbedPath.IndexOf('\')
                    $ScrubbedPath = $ScrubbedPath.Substring($ScrubbedPath.IndexOf('\', $FirstIndex + 1))
                }

                Write-Host "Cannot extract ComponentID from $ScrubbedPath"
                continue;
            }

            $COMObjectInfoList.Add(
                (New-Object COMObjectInfo -Property @{
                    ComponentID = $ComponentID
                    AssemblyProperties = $Key.GetValue("Assembly")
                    CodeBase = Get-ValidLibraryFilePath -FilePath $($Key.GetValue("CodeBase"))
                    ClassName = $Key.GetValue("Class")
                    RuntimeVersion = $Key.GetValue("RuntimeVersion")
                })) | Out-Null
        }
        catch
        {
            Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
            continue;
        }
    }

    $COMObjectInfoList += Get-UnloadedUserKeys

    # Dedup objects and return
    return $($COMObjectInfoList | Sort-Object -Unique -Property ComponentID, AssemblyProperties)
}

function Get-AssemblyDefinedTypes
{
    param([System.Reflection.Assembly]$Assembly, [string]$RunTimeVersion, [string]$ClassName,[string]$AssemblyPath)

    $LastError = $null
    for($i = 0; $i -lt $global:MaxDependencyLevel; $i++)
    {
        try
        {
            return $Assembly.GetType($ClassName)
        }
        catch [System.IO.FileLoadException]
        {
            if($_.Exception.Message.Equals($LastError))
            {
                break;
            }

            $LastError = $_.Exception.Message
            Load-AssemblyDependenciesFromSameFolder -MissingTypesMessage $LastError -AssemblyPath $AssemblyPath
        }
    }

    # if we were able to load the dependencies this should work. otherewise, throw exception
    return $Assembly.GetType($ClassName)
}

function Load-AssemblyDependenciesFromSameFolder
{
    param([string]$MissingTypesMessage,[string]$AssemblyPath)
    
    if([string]::IsNullOrEmpty($MissingTypesMessage))
    {
        Write-Host "MissingTypesMessage is empty"
        return;
    }

    if([string]::IsNullOrEmpty($AssemblyPath) -or 
        $AssemblyPath.StartsWith($global:GACv2Path, [System.StringComparison]::OrdinalIgnoreCase) -or 
        $AssemblyPath.StartsWith($global:GACv4Path, [System.StringComparison]::OrdinalIgnoreCase))
    {
        return;
    }

    try
    {
        $AssemblyNameStr = Extract-Regex -Data $MissingTypesMessage -RegexPattern $global:AssemblyExtractionRegex
        if([string]::IsNullOrEmpty($AssemblyNameStr))
        {
            $AssemblyNameStr = Extract-Regex -Data $MissingTypesMessage -RegexPattern $global:AssemblyExtractionRegexFallback
            if([string]::IsNullOrEmpty($AssemblyNameStr))
            {
                Write-Host "Couldn't extract assembly name using regex: $MissingTypesMessage"
                return;
            }
        }

        try
        {
            $AssemblyName = [System.Reflection.AssemblyName]::new($AssemblyNameStr)
        }
        catch
        {
            Write-Host "Invalid Assembly Name: $AssemblyNameStr"
            return;
        }

        $Folder = [System.IO.Path]::GetDirectoryName($AssemblyPath)
        $AssemblyToLoad = [Loader]::SearchOnDifferentFolder($AssemblyName, $Folder)
        if([string]::IsNullOrEmpty($AssemblyToLoad))
        {
            Write-Host "Couldn't find dependency: $AssemblyNameStr"
            return;
        }

        [Loader]::SafeLoadDllFile($AssemblyToLoad) | Out-Null
    }
    catch [System.IO.FileLoadException]
    {
        # Use wildcard match "*API*appdomain*" to overcome language differences
        if($_.Exception.Message -notlike "*API*" -and $_.Exception.Message -notlike "*appdomain*")
        {
            Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
        }
    }
    catch
    {
        Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    }
}

function Test-RawFileText
{
    param([string]$FilePath, [string]$Text)

    try
    {
        $FileContnent = [System.IO.File]::ReadAllText($FilePath)
        return $FileContnent.Contains($Text)
    }
    catch
    {
        Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"           
        return $false
    }
}

function Evaluate-ComObjectsGuidMismatch
{
    ## ## Init ## ##
    $Results = New-Object psobject -Property @{
        LoadedAssemblyReflectionsCount = 0
        EmptyDefinedTypes = 0
        AssemblyPropertiesIsEmpty = 0
        CouldntGetDllPath = 0
        DllFileDoNotExist = 0
        ClassNameIsEmpty = 0
        InvalidResultsSearchingGuidInsideDll = 0
        MismatchCount = 0
        Success = $true
        TotalCOMObjects = 0
        HasPatchedDotNetVersion = $global:HasPatchedDotNetVersion
        PatchedCOMObjects = 0
        HasOlderDotNetVersion = $global:HasOlderDotNetVersion
        Reasons = New-Object -TypeName 'System.Collections.Generic.HashSet[string]'
    }
    ## ## ## ## ## ##

    try
    {
        $COMObjectsRegistryPaths = Get-AllCOMObjectsRegistryPaths
        $Results.TotalCOMObjects = $COMObjectsRegistryPaths.Count
        if($COMObjectsRegistryPaths.Count -gt $global:MaxComObjects)
        {
            # if we reached the limit, shuffle the list and get $global:MaxComObjects amount of objects
            $COMObjectsRegistryPaths = $COMObjectsRegistryPaths | Get-Random -Count $global:MaxComObjects
            $Results.Reasons.Add("Reached maximum objects") | Out-Null
            $Results.Success = $false
        }

        $COMObjects = Get-AllCOMObjectsInfo -RegistryPaths $COMObjectsRegistryPaths
    }
    catch
    {
        Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
        $Results.Reasons.Add("Couldn't get all COM objects") | Out-Null
        $Results.Success = $false
        return $Results;
    }

    $PerformanceCheckCounter = 0
    try
    {
        foreach ($COMObject in $COMObjects)
        {
            $PerformanceCheckCounter++

            # Check that we didn't pass the performance limits
            if(($PerformanceCheckCounter % 10 -eq 0) -and !(Check-PerformanceState))
            {
                $Results.Reasons.Add("Aborting due to performance limits") | Out-Null
                $Results.Success = $false
                break;
            }

            if([string]::IsNullOrEmpty($COMObject.AssemblyProperties))
            {
                $Results.AssemblyPropertiesIsEmpty++
                continue;
            }

            if([string]::IsNullOrEmpty($COMObject.ClassName))
            {
                $Results.ClassNameIsEmpty++
                continue;
            }

            # If the machine has a patched version of .NET, we don't need to check the COM object unless both the object and the client are version 3.5 or lower.
            # Therefore we check if the machine contains an older version of .NET and if the COM object is of an older version. If both are correct we still cannot trust the object.
            # Otherwise, there's no need to check the object as the patch will prevent the GUID check.
            if ($global:HasPatchedDotNetVersion -and (($global:HasOlderDotNetVersion -eq $false) -or ([version]($COMObject.RuntimeVersion -replace "v","") -eq [version]"4.0.30319")))
            {
                $Results.PatchedCOMObjects++
                continue;
            }

            # Get the dll file path, if code base is empty serach on GAC folder
            $COMPath = Get-GACAssembly -AssemblyProperties $COMObject.AssemblyProperties -RunTimeVersion $COMObject.RuntimeVersion
            if ([string]::IsNullOrEmpty($COMPath))
            {
                $COMPath = $COMObject.CodeBase
            }

            # This might happen frequently - we skip to avoid FPs
            if([string]::IsNullOrEmpty($COMPath))
            {
                $Results.CouldntGetDllPath++
                continue;
            }

            if(!(Test-Path $COMPath))
            {
                $Results.DllFileDoNotExist++
                continue;
            }

            $LoadedAssembly = $null
            try
            {
                $LoadedAssembly = [appdomain]::CurrentDomain.ReflectionOnlyGetAssemblies() | Where-Object { $_.FullName -eq $COMObject.AssemblyProperties } | Select-Object -First 1
                # Loading the same dll again and again will cause exeptions.
                # There might be different com objects under the same dll
                if($LoadedAssembly -eq $null)
                {
                    $LoadedAssembly = [Loader]::SafeLoadDllFile($COMPath)
                }
            }
            catch [System.IO.FileLoadException]
            {
                # Use wildcard match "*API*appdomain*" to overcome language differences
                if(($_.Exception.Message -like "*API*" -or $_.Exception.Message -like "*appdomain*") -and [appdomain]::CurrentDomain.ReflectionOnlyGetAssemblies().Count -gt 1)
                {
                    # This specific error still loads the assembly to the last position
                    $LoadedAssembly = [appdomain]::CurrentDomain.ReflectionOnlyGetAssemblies()[-1]
                }
                else
                {
                    Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
                    $Results.Reasons.Add("Assembly load error") | Out-Null
                    $Results.Success = $false
                    continue;
                }
            }
            catch
            {
                Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
                $Results.Reasons.Add("Assembly load error") | Out-Null
                $Results.Success = $false
                continue;
            }

            $Attrib = ($LoadedAssembly.CustomAttributes | Where-Object { $_.AttributeType.Name -eq "AssemblyCompanyAttribute" })
            $IsTrusted = ![string]::IsNullOrEmpty($Attrib) -and $Attrib.ToString() -like "*Microsoft*"

            $DefinedType = $null
            try
            {
                $DefinedType = Get-AssemblyDefinedTypes -Assembly $LoadedAssembly -RunTimeVersion $COMObject.RuntimeVersion -ClassName $COMObject.ClassName -AssemblyPath $COMObject.CodeBase
                
                # The class doesnt exit inside the dll
                if($DefinedType -eq $null)
                {
                    continue;
                }
            }
            catch [System.IO.FileLoadException]
            {
                if(!$IsTrusted)
                {
                    if(Test-RawFileText -FilePath $COMPath -Text $COMObject.ComponentID)
                    {
                        continue;
                    }

                    $Results.EmptyDefinedTypes++
                    $Results.Reasons.Add("Empty Defined Types") | Out-Null
                    $Results.Success = $false

                    $ImmuneComAnalyzerEventEtw = New-Object ImmuneComAnalyzerEvent -Property @{
                        RegistryGuid = $COMObject.ComponentID
                        ActualClassGuid = if($Attrib -ne $null){ $Attrib.ToString()} else { $null }
                        ClassName = $COMObject.ClassName
                        DllPath = $COMPath
                        AssemblyProperties = $COMObject.AssemblyProperties
                        RuntimeVersion = $COMObject.RuntimeVersion
                    }

                    $global:EtwProvider.Write("ImmuneComAnalyzerEvent", $ImmuneComAnalyzerEventEtw)
                }

                continue;
            }
            catch
            {
                Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
                $Results.Reasons.Add("Defined Types Error") | Out-Null
                $Results.Success = $false
                continue;
            }

            $ExtractedGUIDs = @($DefinedType | Select-Object -ExpandProperty Guid | Select-Object -ExpandProperty Guid)
            
            # The com class might be deprecated / removed from dll but still exist in the registry
            if($ExtractedGUIDs -eq $null -or $ExtractedGUIDs.Count -eq 0)
            {
                if(!$IsTrusted)
                {
                    $Results.InvalidResultsSearchingGuidInsideDll++
                }

                continue;
            }

            if($ExtractedGUIDs -contains $COMObject.ComponentID)
            {
                continue;
            }

            $Results.MismatchCount++
            $ImmuneComAnalyzerEventEtw = New-Object ImmuneComAnalyzerEvent -Property @{
                RegistryGuid = $COMObject.ComponentID
                ActualClassGuid = $($ExtractedGUIDs -join ";")
                ClassName = $COMObject.ClassName
                DllPath = $COMPath
                AssemblyProperties = $COMObject.AssemblyProperties
                RuntimeVersion = $COMObject.RuntimeVersion
            }

            $global:EtwProvider.Write("ImmuneComAnalyzerEvent", $ImmuneComAnalyzerEventEtw)
        }

        $Results.LoadedAssemblyReflectionsCount = [appdomain]::CurrentDomain.ReflectionOnlyGetAssemblies().Count
    }
    catch
    {
        Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
        $Results.Reasons.Add("Execution error") | Out-Null
        $Results.Success = $false
    }

    return $Results
}

function Write-FinalStats 
{
    try 
    {
        # Define unexpected values
        $invalidValues = @($null, 0)
        $defaultValue = -1

        Write-Host "Writing telemtry" 

        # Calculate and display time duration
        if ($global:StartTime -isnot [DateTime]) {
            throw "Invalid start time: $global:StartTime"
        }

        $operationDuration = [Math]::Round((New-TimeSpan -Start $global:StartTime -End (Get-Date) | Select-Object -ExpandProperty TotalSeconds), 2)  
        Write-Host "Duration->$operationDuration"

        # Retrieve total memory and process information
        $totalMemoryCapacity = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum
        $currentProcessInfo = Get-Process -Id $Pid -ErrorAction Stop
        $currentProcessWorkingSetSize = $currentProcessInfo.WS / 1024

        # Calculate and display memory utilization
        $memoryUsagePercentage = $defaultValue
        if ($totalMemoryCapacity -notin $invalidValues) 
        {
            $memoryUsagePercentage = [Math]::Round(($currentProcessInfo.WS * 100 / $totalMemoryCapacity), 2)
        }

        Write-Host "Memory->$($currentProcessWorkingSetSize)Kb,$memoryUsagePercentage%"

        # Calculate and display CPU usage
        $WmiInfo = Get-CimInstance -class Win32_processor
        $runningPeriodInSeconds = $((New-TimeSpan -Start $currentProcessInfo.StartTime).TotalSeconds)
        $totalLogicalProcessors = ($WmiInfo | Measure-Object -Property NumberOfLogicalProcessors -Sum).Sum
        $currentCPUUsage = [Math]::Round(($currentProcessInfo.CPU), 2)
        $cpuUsagePercentage = $defaultValue
        if ($totalLogicalProcessors -notin $invalidValues -and $runningPeriodInSeconds -notin $invalidValues) 
        {
            # calculate what is the CPU time usage of the script ((script CPU usage / execution time %) / processors)
            $cpuUsagePercentage = [Math]::Round((($currentProcessInfo.CPU * 100 / $runningPeriodInSeconds) / $totalLogicalProcessors), 2)
        }

        Write-Host "CPU->$currentCPUUsage,$cpuUsagePercentage%"

        # Calculate and display total CPU usage
        $averageCpuLoad = [Math]::Round(($WmiInfo | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average), 2)
        Write-Host "TotalCpu->$global:StartCpu%,$averageCpuLoad%"
    }
    catch 
    {
        Write-Host "OutputFinalStats: Operation failed due to $($_.ToString()) at line $($_.InvocationInfo.ScriptLineNumber)"
    }
}

# Get all the device logged-on users registry hives
function Get-UserHives
{
    return $global:Win32UserProfiles | Where-Object { !$_.Special -and (Test-Path "Registry::HKEY_USERS\$($_.SID)") } | Select-Object @{ Label="SID";Expression={ "Registry::HKEY_USERS\$($_.SID)" } } | Select-Object -ExpandProperty SID -Unique
}

# Get all the COM objcets under the same registry root
function Get-COMRegistryPathsFromRegRoot
{
    param([Parameter(mandatory=$true)][string]$RegRoot)

    $COMObjectsList = @()
    $COMObjectsList += Get-RootPathCOMObjects -RegRoot "$RegRoot\SOFTWARE\Classes"
    $COMObjectsList += Get-RootPathCOMObjects -RegRoot "$RegRoot\SOFTWARE\Classes\WOW6432Node"
    return $COMObjectsList
}

# Find the highest version to take
function Get-MaxStringVersion
{
    param([string[]]$Versions)

    $MaxVersion = $null
    $MaxVersionStr = $null
    foreach($Version in $Versions)
    {
        $ParsedVersion = $null
        if([version]::TryParse($Version, [ref]$ParsedVersion))
        {
            if($MaxVersion -eq $null -or $ParsedVersion -gt $MaxVersion)
            {
                $MaxVersion = $ParsedVersion
                $MaxVersionStr = $Version
            }
        }
    }

    return $MaxVersionStr
}

function Get-RootPathCOMObjects
{
    param([Parameter(mandatory=$true)][string]$RegRoot)

    $COMObjectsList = New-Object -TypeName 'System.Collections.Generic.HashSet[string]'
    if(!(Test-Path "$RegRoot\CLSID"))
    {
        return $COMObjectsList
    }

    $COMObjects = Get-ChildItem "$RegRoot\CLSID\{*-*-*-*-*}\InProcServer32" -ErrorAction Stop
    foreach ($COMObject in $COMObjects)
    {
        $DefaultKeyRaw = $COMObject.GetValue([string]::Empty)
        if($DefaultKeyRaw -eq $null)
        {
            continue;
        }
        
        [string]$DefaultKey = $null
        $KeyType = $DefaultKeyRaw.GetType()
        if($KeyType -eq [byte[]])
        {
            $DefaultKey = [System.Text.Encoding]::Unicode.GetString($DefaultKeyRaw)
        }
        elseif($KeyType -eq [string])
        {
            $DefaultKey = $DefaultKeyRaw
        }
        else
        {
            continue;
        }

        if ([string]::IsNullOrEmpty($DefaultKey) -or !$DefaultKey.EndsWith($global:COMDllName, [System.StringComparison]::OrdinalIgnoreCase))
        {
            continue
        }
        
        $AssemblyKey = $COMObject.GetValue("Assembly")
        # Ignore known safe assemblies
        if ([string]::IsNullOrEmpty($AssemblyKey) -or 
            $AssemblyKey.StartsWith("mscorlib", [System.StringComparison]::OrdinalIgnoreCase) -or 
            $AssemblyKey.StartsWith("Microsoft.", [System.StringComparison]::OrdinalIgnoreCase) -or 
            $AssemblyKey.StartsWith("System.", [System.StringComparison]::OrdinalIgnoreCase))
        {
            continue
        }

        [string]$Path = "Registry::" + $COMObject.Name
        if($COMObject.SubKeyCount -gt 0)
        {
            $SubKeys = $COMObject.GetSubKeyNames()
            $MaxVersionStr = Get-MaxStringVersion -Versions $SubKeys

            if(![string]::IsNullOrEmpty($MaxVersionStr))
            {
                $Path += "\$MaxVersionStr"
            }
        }
 
        $COMObjectsList.Add($Path) | Out-Null
    }
 
    return $COMObjectsList;
}

# Get all the COM objcets registered to local machine
function Get-LocalMachineCOMObjects
{
    return $(Get-COMRegistryPathsFromRegRoot -RegRoot "Registry::HKEY_LOCAL_MACHINE")
}

# Get all the COM objcets info which are registered under currently logged-on users
function Get-UsersCOMObjects
{
    $UserRegPaths = New-Object -TypeName 'System.Collections.Generic.HashSet[string]'
    [string[]]$UsersSid = Get-UserHives
    foreach ($Sid in $UsersSid)
    {
       [string[]]$UserComObjects = @(Get-COMRegistryPathsFromRegRoot -RegRoot $Sid)
       $UserRegPaths.UnionWith($UserComObjects)
    }

    return $UserRegPaths
}

# Check using event log whether the powershell policy will conflict
function Check-PowershellPolicy
{
    $UMCIPolicies = @{};
    $HasActiveUmciPolicy, $HasAuditUmciPolicy, $UMCIPolicyExists, $HasEnabledScriptEnforcementPolicy = $false, $false, $false, $false;
    try
    {
        Get-WinEvent -FilterHashtable @{"LogName" = "Microsoft-Windows-CodeIntegrity/Operational"} -ErrorAction Stop | 
        Where-Object {
            $_.Id -in @(3096, 3099)
        } | 
        Sort-Object -Property TimeCreated -Descending | 
        ForEach-Object { 
            $DataObject = New-Object psobject -Property @{
                Xml = ([xml]$_.toXml()).Event.EventData.Data
                TimeCreated = $_.TimeCreated
            }

            $PolicyGuid = $DataObject.Xml | Where-Object {$_.Name -eq "PolicyGUID"} | Select-Object -First 1 -ExpandProperty '#text'
            if (!$UMCIPolicies.ContainsKey(($PolicyGuid))) 
            {
                $UMCIPolicies[$PolicyGuid] = $DataObject
            }
        }
    }
    catch
    {
        if($_.CategoryInfo.Category -ne "ObjectNotFound")
        {
            Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
        }

        return $null
    }

    foreach ($PolicyGuid in $UMCIPolicies.Keys) 
    {
        $OptionsAsStr = $UMCIPolicies[$PolicyGuid].Xml| Where-Object { $_.Name -eq "Options" } | Select-Object -First 1 -ExpandProperty '#text'
        $Options = [int]($OptionsAsStr)
        
        # Write ETW for each policy. 
        # TO DO: remove once we have it from sense
        $ImmuneCodeIntegrityEventEtw = New-Object ImmuneCodeIntegrityEvent -Property @{
            CreatedTime = $UMCIPolicies[$PolicyGuid].TimeCreated.ToFileTimeUtc()
            Options = $OptionsAsStr
            PolicyNameBuffer = $UMCIPolicies[$PolicyGuid].Xml| Where-Object { $_.Name -eq "PolicyNameBuffer" } | Select-Object -First 1 -ExpandProperty '#text'
            PolicyIdBuffer = $UMCIPolicies[$PolicyGuid].Xml| Where-Object { $_.Name -eq "PolicyIdBuffer" } | Select-Object -First 1 -ExpandProperty '#text'
            PolicyGUID = $PolicyGuid
            Status = $UMCIPolicies[$PolicyGuid].Xml| Where-Object { $_.Name -eq "Status" } | Select-Object -First 1 -ExpandProperty '#text'
            PolicyHash = $UMCIPolicies[$PolicyGuid].Xml| Where-Object { $_.Name -eq "PolicyHash" } | Select-Object -First 1 -ExpandProperty '#text'
        }

        $global:EtwProvider.Write("ImmuneCodeIntegrityEvent", $ImmuneCodeIntegrityEventEtw)

        # Non-UMCI policy doesn't affect us
        # When UMCI is enabled bit 2 is on
        if (($Options -band (1 -shl 2)) -eq 0) 
        {
            continue;
        }

        $UMCIPolicyExists = $true;
        $HasAuditUmciPolicy = $HasAuditUmciPolicy -or (($Options -band (1 -shl 16)) -ne 0);
        # When audit is disabled the policy is active
        $HasActiveUmciPolicy = $HasActiveUmciPolicy -or (($Options -band (1 -shl 16)) -eq 0);
        # When "Disabled:Script Enforcement" is present bit 24 is on
        $HasEnabledScriptEnforcementPolicy = $HasEnabledScriptEnforcementPolicy -or (($Options -band (1 -shl 24)) -eq 0);
    }

    # An audit policy with script enforcement but no active policy
    return ($HasEnabledScriptEnforcementPolicy -and $HasAuditUmciPolicy -and $UMCIPolicyExists -and !$HasActiveUmciPolicy);
}

function Set-ExitCodeAndExit
{
    param($ExitCode)
    $Host.SetShouldExit($ExitCode)
    exit
}

# Get dll information from the known GAC paths
function Get-GACAssembly
{
    param([string]$AssemblyProperties, [string]$RunTimeVersion)

    try
    {
        $AssemblyName = [System.Reflection.AssemblyName]::new($AssemblyProperties)
    }
    catch
    {
        Write-Host "Assembly name error: $($_.Exception.Message)" 
        return $null
    }

    $FilePath = [Loader]::GetAssemblyPathFromGAC($AssemblyName, $RunTimeVersion)
    return $FilePath
}

# Safe function to get offreg key values
function Get-OffregValue
{
    param([OffregLib.OffregKey]$SubKey, [string]$KeyName)

    try
    {
        return $SubKey.GetValue($KeyName)
    }
    catch
    {
        return $null
    }
}

# Get all com objects from offline user registry hive
function Get-ComObjectsFromOfflineHive
{
    param([OffregLib.OffregKey]$Hive)

    $COMObjects = [System.Collections.ArrayList]@()
    
    if(!$Hive.SubkeyExist("CLSID"))
    {
        return $COMObjects
    }

    # Load the general CLSID hive 
    $CLSIDKey = $Hive.OpenSubKey("CLSID")

    foreach ($ComponentID in $CLSIDKey.GetSubKeyNames())
    {
        $Class = $CLSIDKey.OpenSubKey($ComponentID)
        if (!$Class.SubkeyExist("InProcServer32"))
        {
            continue
        }

        $CurrentKey = $Class.OpenSubKey("InProcServer32")
        # Get the (default) reg value to get the component id which is the class guid
        $DefaultKeyRaw = Get-OffregValue -SubKey $CurrentKey -KeyName ([string]::Empty)
        if($DefaultKeyRaw -eq $null)
        {
            continue;
        }
        
        [string]$DefaultKey = $null
        $KeyType = $DefaultKeyRaw.GetType()
        if($KeyType -eq [byte[]])
        {
            $DefaultKey = [System.Text.Encoding]::Unicode.GetString($DefaultKeyRaw)
        }
        elseif($KeyType -eq [string])
        {
            $DefaultKey = $DefaultKeyRaw
        }
        else
        {
            continue;
        }

        # Make sure the component mscoree.dll (.net). other coms are not relevant
        if ([string]::IsNullOrEmpty($DefaultKey) -or !$DefaultKey.EndsWith($global:COMDllName, [System.StringComparison]::OrdinalIgnoreCase))
        {
            continue;
        }

        if ($CurrentKey.SubkeyCount -gt 0)
        {
            $Subkeys = $CurrentKey.GetSubKeyNames()
            $MaxVersionStr = Get-MaxStringVersion -Versions $SubKeys

            if(![string]::IsNullOrEmpty($MaxVersionStr))
            {
                $CurrentKey = $CurrentKey.OpenSubKey($MaxVersionStr)
            }
        }

        $AssemblyKey = Get-OffregValue -SubKey $CurrentKey -KeyName "Assembly"
        if ([string]::IsNullOrEmpty($AssemblyKey) -or 
                $AssemblyKey.StartsWith("mscorlib", [System.StringComparison]::OrdinalIgnoreCase) -or 
                $AssemblyKey.StartsWith("Microsoft.", [System.StringComparison]::OrdinalIgnoreCase) -or 
                $AssemblyKey.StartsWith("System.", [System.StringComparison]::OrdinalIgnoreCase))
        {
                continue
            }

        # Get the class dll path
        $CodeBase = Get-OffregValue -SubKey $CurrentKey -KeyName "CodeBase"
        $DllPath = Get-ValidLibraryFilePath -FilePath $CodeBase
        $COMObjects.Add(
                (New-Object COMObjectInfo -Property @{
                    ComponentID = $ComponentID.Substring(1,36)
                    AssemblyProperties = $AssemblyKey
                    CodeBase = $DllPath
                    ClassName = Get-OffregValue -SubKey $CurrentKey -KeyName "Class"
                    RuntimeVersion = Get-OffregValue -SubKey $CurrentKey -KeyName "RuntimeVersion"
                }))| Out-Null




        $CurrentKey.Close() | Out-Null
    }

    $CLSIDKey.Close() | Out-Null
    return $COMObjects
}

# Get all com objects from user DAT file
function Get-ComObjectsFromDatFile
{
    param([string]$FilePath)
    $UserCOMList = [System.Collections.ArrayList]@()
    if(!(Test-Path $FilePath))
    {
        return $UserCOMList
    }

    try
    {
        $Hive = [OffregLib.OffregHive]::Open($FilePath)
        $UserCOMList += Get-ComObjectsFromOfflineHive -Hive $Hive.Root
        if($Hive.Root.SubkeyExist("WOW6432Node"))
        {
            $UserCOMList += Get-ComObjectsFromOfflineHive -Hive $Hive.Root.OpenSubKey("WOW6432Node")
        }
    }
    catch
    {
        Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
        continue;
    }
    finally
    {
        if($Hive -ne $null)
        {
            $Hive.Close()
        }
    }

    return $UserCOMList
}

# Get the registered COM objects under logged off users.
# This is "nice to have" info as the dll might not exist
function Get-UnloadedUserKeys
{
    $UnloadedUserCOMList = [System.Collections.ArrayList]@()
    # Make sure offreg.dll is valid before we use it
    if(!(Test-OffregDllValidity))
    {
        return $UnloadedUserCOMList
    }

    # Get all user profile that are not logged-on and were active in the last $global:MaxLastLogonTimeOfUsersToSearch days
    $NotLoadedProfilePaths = $global:Win32UserProfiles |
        Where-Object { !$_.Special -and !$_.Loaded -and $_.LastUseTime -gt $global:MaxLastLogonTimeOfUsersToSearch } |
        Sort-Object -Descending LastUseTime |
        Select-Object @{label="Path";expression={"$($_.LocalPath)\$global:AppDataFilePath"}} -First $global:MaxLoggedOffUsersToTake | Select-Object -ExpandProperty Path -Unique

    # Foreach user parse the DAT file
    foreach ($UserProfilePath in $NotLoadedProfilePaths)
    {
        $UnloadedUserCOMList += Get-ComObjectsFromDatFile -FilePath $UserProfilePath
    }

    return $UnloadedUserCOMList
}

# Check whether the offreg.dll file is valid
function Write-ControlRegistryKeys
{
    param([Nullable[bool]]$HasMismatchComObjects,[Nullable[bool]]$ResultSuccess, [Nullable[bool]]$PowershellPolicy, [string]$DeviceGuardStatus)

    try
    {
        $RegLocation = $null
        if(Test-Path $global:RegistryPath)
        {
            $RegLocation = Get-Item $global:RegistryPath -ErrorAction Stop
        }
        else
        {
            $RegLocation = New-Item $global:RegistryPath -Force -ErrorAction Stop
        }

        if($ResultSuccess -eq $true -or $HasMismatchComObjects -eq $true)
        {
            $RegLocation | New-ItemProperty -Name $global:COMKey -Value $HasMismatchComObjects -PropertyType DWORD -Force -ErrorAction Stop | Out-Null
        }

        if($PowershellPolicy -ne $null)
        {
            $RegLocation | New-ItemProperty -Name $global:PowershellKey -Value $PowershellPolicy -PropertyType DWORD -Force -ErrorAction Stop | Out-Null
        }

        if($DeviceGuardStatus -eq "Enforced")
        {
            $RegLocation | New-ItemProperty -Name $global:ControlKey -Value $true -PropertyType DWORD -Force -ErrorAction Stop | Out-Null
            return $true
        }

        $HasIssue = $HasMismatchComObjects -eq $true -or $PowershellPolicy -eq $true
        if($HasIssue)
        {
            $RegLocation | New-ItemProperty -Name $global:ControlKey -Value $false -PropertyType DWORD -Force -ErrorAction Stop | Out-Null
            return $false
        }

        if($ResultSuccess -eq $true -and $PowershellPolicy -ne $null)
        {
            $RegLocation | New-ItemProperty -Name $global:ControlKey -Value $true -PropertyType DWORD -Force -ErrorAction Stop | Out-Null
            return $true
        }
    }
    catch
    {
        Write-Host "At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    }

    return $null
}

# Check whether the offreg.dll file is valid
function Test-OffregDllValidity
{
    if(!(Test-Path $global:OffregDllPath))
    {
        Write-Host "Cannot find $global:OffregDllPath"
        return $false
    }

    try
    {
        $Signature = Get-AuthenticodeSignature $global:OffregDllPath
        if($Signature.Status -eq "Valid" -and $Signature.SignerCertificate.Subject -eq $global:OffregDllCertificateSubject)
        {
            return $true
        }
        
        Write-Host "Test-OffregDllValidity: Invalid signature"
    }
    catch
    {
        Write-Host "Test-OffregDllValidity: At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"   
    }

    return $false
}

$Code = @"
using System;
using System.IO;
using System.Collections.Generic;
using System.Reflection;
using System.ComponentModel;
using System.Diagnostics;
using System.Diagnostics.Tracing;
using System.Runtime.InteropServices;
using System.Text;
using FILETIME = System.Runtime.InteropServices.ComTypes.FILETIME;

namespace OffregLib
{
    internal static class OffregHelper
    {
        public static Encoding StringEncoding
        {
            get { return Encoding.Unicode; }
        }

        public const int SingleCharBytes = 2;

        public static bool TryConvertValueDataToObject(RegValueType type, byte[] data, out object parsedData)
        {
            parsedData = data;
            // We only need REG_SZ support
            if ((type != RegValueType.REG_SZ && type != RegValueType.REG_EXPAND_SZ && type != RegValueType.REG_LINK) || data.Length % 2 != 0)
                return false;

            // Remove all the trailing nulls
            int toIndex = 0;
            while (data.Length > toIndex + 2 && (data[toIndex] != 0 || data[toIndex + 1] != 0))
                toIndex += 2;

            parsedData = StringEncoding.GetString(data, 0, toIndex);
            return true;
        }
    }

    public abstract class OffregBase : IDisposable
    {
        protected IntPtr _intPtr;

        public abstract void Close();

        public abstract void Dispose();
    }

    public enum Win32Result
    {
        ERROR_SUCCESS = 0,
        ERROR_MORE_DATA = 234,
    }

    public enum RegValueType : uint
    {
        REG_NONE = 0,
        REG_SZ = 1,
        REG_EXPAND_SZ = 2,
        REG_BINARY = 3,
        REG_DWORD = 4,
        REG_DWORD_LITTLE_ENDIAN = 4,
        REG_DWORD_BIG_ENDIAN = 5,
        REG_LINK = 6,
        REG_MULTI_SZ = 7,
        REG_RESOURCE_LIST = 8,
        REG_FULL_RESOURCE_DESCRIPTOR = 9,
        REG_RESOURCE_REQUIREMENTS_LIST = 10,
        REG_QWORD = 11,
        REG_QWORD_LITTLE_ENDIAN = 11
    }

    public enum SECURITY_INFORMATION : uint
    {
        OWNER_SECURITY_INFORMATION = 0x00000001,
        GROUP_SECURITY_INFORMATION = 0x00000002,
        DACL_SECURITY_INFORMATION = 0x00000004,
        SACL_SECURITY_INFORMATION = 0x00000008,
        LABEL_SECURITY_INFORMATION = 0x00000010,
        PROTECTED_DACL_SECURITY_INFORMATION = 0x80000000,
        PROTECTED_SACL_SECURITY_INFORMATION = 0x40000000,
        UNPROTECTED_DACL_SECURITY_INFORMATION = 0x20000000,
        UNPROTECTED_SACL_SECURITY_INFORMATION = 0x10000000,
    }

    public static class OffregNative
    {
        [DllImport("offreg.dll", EntryPoint = "OROpenHive", CharSet = CharSet.Unicode)]
        [DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
        public static extern Win32Result OpenHive(string path, out IntPtr rootKeyHandle);

        [DllImport("offreg.dll", EntryPoint = "ORCloseHive", CharSet = CharSet.Unicode)]
        [DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
        public static extern Win32Result CloseHive(IntPtr rootKeyHandle);

        [DllImport("offreg.dll", EntryPoint = "ORCloseKey")]
        [DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
        public static extern Win32Result CloseKey(IntPtr hKey);


        [DllImport("offreg.dll", EntryPoint = "OREnumKey", CharSet = CharSet.Unicode)]
        [DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
        public static extern Win32Result EnumKey(
            IntPtr hKey,
            uint dwIndex,
            StringBuilder lpName,
            ref uint lpcchName,
            StringBuilder lpClass,
            IntPtr lpcchClass,
            IntPtr lpftLastWriteTime);

        [DllImport("offreg.dll", EntryPoint = "ORGetValue", CharSet = CharSet.Unicode)]
        [DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
        public static extern Win32Result GetValue(
            IntPtr hKey,
            string lpSubKey,
            string lpValue,
            out RegValueType pdwType,
            IntPtr pvData,
            ref uint pcbData);

        [DllImport("offreg.dll", EntryPoint = "OROpenKey", CharSet = CharSet.Unicode)]
        [DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
        public static extern Win32Result OpenKey(
            IntPtr hKey,
            string lpSubKey,
            out IntPtr phkResult);

        [DllImport("offreg.dll", EntryPoint = "ORQueryInfoKey", CharSet = CharSet.Unicode)]
        [DefaultDllImportSearchPaths(DllImportSearchPath.System32)]
        public static extern Win32Result QueryInfoKey(
            IntPtr hKey,
            StringBuilder lpClass,
            ref uint lpcchClass,
            ref uint lpcSubKeys,
            ref uint lpcbMaxSubKeyLen,
            ref uint lpcbMaxClassLen,
            ref uint lpcValues,
            ref uint lpcbMaxValueNameLen,
            ref uint lpcbMaxValueLen,
            ref uint lpcbSecurityDescriptor,
            ref FILETIME lpftLastWriteTime);
    }

    internal class QueryInfoKeyData
    {
        public string Class { get; set; }
        public uint SubKeysCount { get; set; }

        public uint MaxSubKeyLen { get; set; }

        public uint MaxClassLen { get; set; }

        public uint ValuesCount { get; set; }

        public uint MaxValueNameLen { get; set; }

        public uint MaxValueLen { get; set; }
        public uint SizeSecurityDescriptor { get; set; }
        public FILETIME LastWriteTime { get; set; }
    }
    public class OffregKey : OffregBase
    {
        public string Name { get; protected set; }

        public string FullName { get; protected set; }

        private OffregKey _parent;

        public int SubkeyCount
        {
            get { return (int)_metadata.SubKeysCount; }
        }

        public int ValueCount
        {
            get { return (int)_metadata.ValuesCount; }
        }

        private bool _ownsPointer = true;

        private QueryInfoKeyData _metadata;

        internal OffregKey(OffregKey parent, IntPtr ptr, string name)
        {
            _intPtr = ptr;

            Name = name;
            FullName = (parent == null || parent.FullName == null ? "" : parent.FullName + "\\") + name;
            _parent = parent;

            _metadata = new QueryInfoKeyData();
            RefreshMetadata();
        }

        internal OffregKey(OffregKey parentKey, string name)
        {
            Win32Result result = OffregNative.OpenKey(parentKey._intPtr, name, out _intPtr);

            if (result != Win32Result.ERROR_SUCCESS)
                throw new Win32Exception((int)result);

            Name = name;
            FullName = (parentKey.FullName == null ? "" : parentKey.FullName + "\\") + name;
            _parent = parentKey;

            _metadata = new QueryInfoKeyData();
            RefreshMetadata();
        }

        private void RefreshMetadata()
        {

            uint sizeClass = 10000;
            uint countSubKeys = 0, maxSubKeyLen = 0, maxClassLen = 0;
            uint countValues = 0, maxValueNameLen = 0, maxValueLen = 0;
            uint securityDescriptorSize = 0;
            FILETIME lastWrite = new FILETIME();

            // Get size of class
            StringBuilder sbClass = new StringBuilder((int)sizeClass);

            Win32Result result = OffregNative.QueryInfoKey(_intPtr, sbClass, ref sizeClass, ref countSubKeys,
                                                           ref maxSubKeyLen,
                                                           ref maxClassLen,
                                                           ref countValues, ref maxValueNameLen, ref maxValueLen,
                                                           ref securityDescriptorSize,
                                                           ref lastWrite);

            if (result == Win32Result.ERROR_MORE_DATA)
            {
                // The returned size does is in characters (unicode), excluding NULL chars. Increment it to have space
                sizeClass = sizeClass + 1;

                // Allocate again
                sbClass = new StringBuilder((int)sizeClass);

                result = OffregNative.QueryInfoKey(_intPtr, sbClass, ref sizeClass, ref countSubKeys, ref maxSubKeyLen,
                                                   ref maxClassLen,
                                                   ref countValues, ref maxValueNameLen, ref maxValueLen,
                                                   ref securityDescriptorSize,
                                                   ref lastWrite);

                if (result != Win32Result.ERROR_SUCCESS)
                    throw new Win32Exception((int)result);
            }
            else if (result != Win32Result.ERROR_SUCCESS)
                throw new Win32Exception((int)result);

            _metadata.Class = sbClass.ToString();
            _metadata.LastWriteTime = lastWrite;

            _metadata.SubKeysCount = countSubKeys;
            _metadata.MaxSubKeyLen = maxSubKeyLen;
            _metadata.MaxClassLen = maxClassLen;
            _metadata.ValuesCount = countValues;
            _metadata.MaxValueNameLen = maxValueNameLen;
            _metadata.MaxValueLen = maxValueLen; // Bytes
            _metadata.SizeSecurityDescriptor = securityDescriptorSize;
        }

        public string[] GetSubKeyNames()
        {
            string[] results = new string[_metadata.SubKeysCount];

            for (uint item = 0; item < _metadata.SubKeysCount; item++)
            {
                uint sizeName = _metadata.MaxSubKeyLen + 1;

                StringBuilder sbName = new StringBuilder((int)sizeName);
                Win32Result result = OffregNative.EnumKey(_intPtr, item, sbName, ref sizeName, null, IntPtr.Zero,
                                                          IntPtr.Zero);

                if (result != Win32Result.ERROR_SUCCESS)
                    throw new Win32Exception((int)result);

                results[item] = sbName.ToString();
            }

            return results;
        }

        public OffregKey OpenSubKey(string name)
        {
            return new OffregKey(this, name);
        }

        public bool TryOpenSubKey(string name, out OffregKey key)
        {
            IntPtr childPtr;
            Win32Result result = OffregNative.OpenKey(_intPtr, name, out childPtr);

            if (result != Win32Result.ERROR_SUCCESS)
            {
                key = null;
                return false;
            }

            key = new OffregKey(this, childPtr, name);
            return true;
        }

        public object GetValue(string name)
        {
            Tuple<RegValueType, byte[]> internalData = GetValueInternal(name);

            if (!Enum.IsDefined(typeof(RegValueType), internalData.Item1))
            {
                WarnDebugForValueType(name, internalData.Item1);
                internalData = new Tuple<RegValueType, byte[]>(RegValueType.REG_BINARY, internalData.Item2);
            }

            object data;
            OffregHelper.TryConvertValueDataToObject(internalData.Item1, internalData.Item2, out data);

            return data;
        }

        public bool ValueExist(string name)
        {
            RegValueType type;
            uint size = 0;
            Win32Result result = OffregNative.GetValue(_intPtr, null, name, out type, IntPtr.Zero, ref size);

            return result == Win32Result.ERROR_SUCCESS;
        }

        public bool SubkeyExist(string name)
        {
            IntPtr intPtr = IntPtr.Zero;
            try
            {
                Win32Result result = OffregNative.OpenKey(_intPtr, name, out intPtr);

                return result == Win32Result.ERROR_SUCCESS;
            }
            finally
            {
                // Close up shop
                if (intPtr != IntPtr.Zero)
                    OffregNative.CloseKey(intPtr);
            }
        }

        internal Tuple<RegValueType, byte[]> GetValueInternal(string name)
        {
            RegValueType type;

            // Get the size first
            uint size = 0;
            Win32Result result = OffregNative.GetValue(_intPtr, null, name, out type, IntPtr.Zero, ref size);

            if (result != Win32Result.ERROR_SUCCESS)
                throw new Win32Exception((int)result);

            // Allocate buffer
            byte[] res = new byte[size];
            IntPtr dataPtr = IntPtr.Zero;
            try
            {
                dataPtr = Marshal.AllocHGlobal((int)size);

                // Get data
                result = OffregNative.GetValue(_intPtr, null, name, out type, dataPtr, ref size);

                if (result != Win32Result.ERROR_SUCCESS)
                    throw new Win32Exception((int)result);

                // Copy data
                Marshal.Copy(dataPtr, res, 0, (int)size);
            }
            finally
            {
                // Release data
                if (dataPtr != IntPtr.Zero)
                    Marshal.FreeHGlobal(dataPtr);
            }

            return new Tuple<RegValueType, byte[]>(type, res);
        }

        public override void Close()
        {
            if (_intPtr != IntPtr.Zero && _ownsPointer)
            {
                Win32Result res = OffregNative.CloseKey(_intPtr);

                if (res != Win32Result.ERROR_SUCCESS)
                    throw new Win32Exception((int)res);
            }
        }

        public override void Dispose()
        {
            Close();
        }

        private void WarnDebugForValueType(string valueName, RegValueType parsedType)
        {
            Debug.WriteLine("WARNING-OFFREGLIB: unknown RegValueType " + parsedType + " converted to Binary in EnumerateValues() at key: " + FullName + ", value: " + valueName);
        }
    }

    public class OffregHive : OffregBase
    {
        public OffregKey Root { get; private set; }

        internal OffregHive(IntPtr hivePtr)
        {
            _intPtr = hivePtr;

            // Represent this as a key also
            Root = new OffregKey(null, _intPtr, null);
        }

        public static OffregHive Open(string hiveFile)
        {
            IntPtr existingHive;
            Win32Result res = OffregNative.OpenHive(hiveFile, out existingHive);

            if (res != Win32Result.ERROR_SUCCESS)
                throw new Win32Exception((int)res);

            return new OffregHive(existingHive);
        }

        public override void Close()
        {
            if (_intPtr != IntPtr.Zero)
            {
                Win32Result res = OffregNative.CloseHive(_intPtr);

                if (res != Win32Result.ERROR_SUCCESS)
                    throw new Win32Exception((int)res);
            }
        }

        public override void Dispose()
        {
            Close();
        }
    }
}

public static class Loader
{
    private const string c_gacSearchPattern = "GAC_*";
    private const string c_assemblyExtension = ".dll";
    private const string c_hexStringFormat = "x2";
    private const string c_v4 = "v4.0";
    private static string s_GacFolderV4 = Environment.GetFolderPath(Environment.SpecialFolder.Windows) + @"\Microsoft.NET\Assembly";
    private static string s_GacFolder = Environment.GetFolderPath(Environment.SpecialFolder.Windows) + @"\Assembly";

    public static void RegisterReflectionLoadResolver()
    {
        AppDomain.CurrentDomain.ReflectionOnlyAssemblyResolve += CurrentDomain_ReflectionOnlyAssemblyResolve;
    }

    private static Assembly CurrentDomain_ReflectionOnlyAssemblyResolve(object sender, ResolveEventArgs args)
    {
        AssemblyName assemblyProperties = new AssemblyName(args.Name);
        Assembly assembly = SearchAssemblyOnMemory(assemblyProperties);
        if (assembly != null)
        {
            return assembly;
        }

        string runtime = null;
        if (args.RequestingAssembly != null && !string.IsNullOrEmpty(args.RequestingAssembly.ImageRuntimeVersion))
        {
            runtime = args.RequestingAssembly.ImageRuntimeVersion;
        }

        string assemblyPath = GetAssemblyPathFromGAC(assemblyProperties, runtime);
        if (!string.IsNullOrEmpty(assemblyPath))
        {
            return SafeLoadDllFile(assemblyPath);
        }

        return null;
    }

    public static Assembly SearchAssemblyOnMemory(AssemblyName assemblyProperties)
    {
        Assembly[] memoryAssembly = AppDomain.CurrentDomain.ReflectionOnlyGetAssemblies();
        if (memoryAssembly.Length == 0)
        {
            return null;
        }

        string assemblyNameWithPolicyStr = null;
        try
        {
            assemblyNameWithPolicyStr = AppDomain.CurrentDomain.ApplyPolicy(assemblyProperties.FullName);
        }
        catch
        {
            // ignore
        }

        foreach (Assembly loadedAssembly in memoryAssembly)
        {
            if (loadedAssembly.FullName.Equals(assemblyProperties.FullName, StringComparison.OrdinalIgnoreCase) ||
                loadedAssembly.FullName.Equals(assemblyNameWithPolicyStr, StringComparison.OrdinalIgnoreCase))
            {
                return loadedAssembly;
            }
        }

        return null;
    }

    public static Assembly SafeLoadDllFile(string assemblyPath)
    {
        byte[] fileBytes = File.ReadAllBytes(assemblyPath);
        return Assembly.ReflectionOnlyLoad(fileBytes);
    }

    public static string GetAssemblyPathFromGAC(AssemblyName assemblyName, string runtimeVersion)
    {
        if (assemblyName == null || string.IsNullOrEmpty(assemblyName.FullName))
        {
            return null;
        }

        string path = SearchAssemblyInsideGAC(assemblyName, runtimeVersion);
        if (string.IsNullOrEmpty(path))
        {
            string assemblyNameWithPolicyStr = null;
            try
            {
                assemblyNameWithPolicyStr = AppDomain.CurrentDomain.ApplyPolicy(assemblyName.FullName);
            }
            catch
            {
                return null;
            }

            if (!string.IsNullOrEmpty(assemblyNameWithPolicyStr) && !assemblyNameWithPolicyStr.Equals(assemblyName.FullName, StringComparison.OrdinalIgnoreCase))
            {
                AssemblyName assemblyNameWithPolicy = new AssemblyName(assemblyNameWithPolicyStr);
                path = SearchAssemblyInsideGAC(assemblyNameWithPolicy, runtimeVersion);
            }
        }

        return path;
    }

    public static string SearchAssemblyInsideGAC(AssemblyName assemblyName, string runtimeVersion)
    {
        if (assemblyName == null)
        {
            return null;
        }

        string path = null;
        if (string.IsNullOrEmpty(runtimeVersion) || runtimeVersion.StartsWith(c_v4))
        {
            path = SearchGACv4(assemblyName);
            if (string.IsNullOrEmpty(path))
            {
                path = SearchGAC(assemblyName);
            }
        }
        else
        {
            path = SearchGAC(assemblyName);
            if (string.IsNullOrEmpty(path))
            {
                path = SearchGACv4(assemblyName);
            }
        }

        return path;
    }

    public static string SearchFileSubPath(string subPath, IEnumerable<string> dirs)
    {
        foreach (string dir in dirs)
        {
            string combinedPath = dir + subPath;
            if (File.Exists(combinedPath))
            {
                return combinedPath;
            }
        }

        return null;
    }

    public static string SearchGACv4(AssemblyName assemblyName)
    {
        if (assemblyName == null)
        {
            return null;
        }

        string filePath = null;
        if (Directory.Exists(s_GacFolderV4))
        {
            IEnumerable<string> dirs = Directory.EnumerateDirectories(s_GacFolderV4, c_gacSearchPattern);
            string version = string.Empty;
            if (assemblyName.Version != null)
            {
                version = assemblyName.Version.ToString();
            }

            string path = "\\" + assemblyName.Name + "\\" + c_v4 + "_" + version + "_" + assemblyName.CultureName + "_" + GetPublicToken(assemblyName) + "\\" + assemblyName.Name + c_assemblyExtension;
            filePath = SearchFileSubPath(path, dirs);
        }
        else
        {
            Console.WriteLine("GAC v4 folder missing");
        }

        return filePath;
    }

    public static string SearchGAC(AssemblyName assemblyName)
    {
        if (assemblyName == null)
        {
            return null;
        }

        string filePath = null;
        if (Directory.Exists(s_GacFolder))
        {
            IEnumerable<string> dirs = Directory.EnumerateDirectories(s_GacFolder, c_gacSearchPattern);
            string version = string.Empty;
            if (assemblyName.Version != null)
            {
                version = assemblyName.Version.ToString();
            }

            string path = "\\" + assemblyName.Name + "\\" + version + "_" + assemblyName.CultureName + "_" + GetPublicToken(assemblyName) + "\\" + assemblyName.Name + c_assemblyExtension;
            filePath = SearchFileSubPath(path, dirs);
        }
        else
        {
            Console.WriteLine("GAC v2 folder missing");
        }

        return filePath;
    }

    public static string GetPublicToken(AssemblyName assemblyName)
    {
        if (assemblyName == null)
        {
            return null;
        }

        StringBuilder str = new StringBuilder();
        byte[] buffer = assemblyName.GetPublicKeyToken();
        if (buffer == null)
        {
            return null;
        }

        foreach (byte b in buffer)
        {
            str.Append(b.ToString(c_hexStringFormat));
        }
        return str.ToString();
    }

    public static string SearchOnDifferentFolder(AssemblyName assemblyName, string folder)
    {
        if (string.IsNullOrEmpty(folder) || !Directory.Exists(folder))
        {
            return null;
        }

        string path = folder + "\\" + assemblyName.Name + c_assemblyExtension;
        if (File.Exists(path))
        {
            return path;
        }

        return null;
    }
}

[EventSource(Name = "Microsoft.Windows.Sense.Immune", Guid = "0daf5190-c9d3-5bfd-81fc-f7044ec454ab")]
public sealed class ImmuneEventSource : EventSource
{
    public ImmuneEventSource() : base(EventSourceSettings.EtwSelfDescribingEventFormat | EventSourceSettings.ThrowOnEventWriteErrors) { }
}

[EventData]
public class ImmuneComAnalyzerEvent
{
    public string RegistryGuid {get; set;}
    public string ActualClassGuid {get; set;}
    public string ClassName { get; set; }
    public string DllPath { get; set; }
    public string AssemblyProperties { get; set; }
    public string RuntimeVersion { get; set; }
}

[EventData]
public class ImmuneComTelemetryEvent
{
    public string DeviceGuardStatus { get; set;}
    public string PowershellPolicyCanConflict { get; set;}
    public string HasComObjectGuidConflict { get; set;}
    public string ClsidCheckEnv { get; set;}
    public string AdditionalInfo { get; set;}
    public string AllowWdacControlsValue { get; set;}
}

[EventData]
public class ImmuneCodeIntegrityEvent
{
    public string CreatedTime { get; set;}
    public string Options { get; set;}
    public string PolicyNameBuffer { get; set;}
    public string PolicyIdBuffer { get; set; }
    public string PolicyGUID { get; set; }
    public string Status { get; set; }
    public string PolicyHash { get; set; }
}

public class COMObjectInfo
{
    public string ComponentID { get; set; }
    public string AssemblyProperties { get; set; }
    public string CodeBase { get; set; }
    public string ClassName { get; set; }
    public string RuntimeVersion { get; set; }
}
"@

# This enable us better tracking of what version was executed on the client
Write-Host "Version 1.9"

try
{
    Add-Type -TypeDefinition $Code -Language CSharp -IgnoreWarnings -ErrorAction Stop
    $global:EtwProvider =  New-Object ImmuneEventSource # For .Net 4.6, use new-object instead [ImmuneEventSource]::new()
}
catch
{
    [version]$InstalledDotNETVersion = Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse -ErrorAction SilentlyContinue |
        Get-ItemProperty -Name Version -ErrorAction SilentlyContinue |
        Where-Object { $_.PSChildName -match '^(?!S)\p{L}'} |
        Select-Object -ExpandProperty Version | Sort-Object | Select-Object -Last 1

    Write-Host "Error on Add-Type: $_"
    Write-Host ".Net Version: $($InstalledDotNETVersion.ToString())"
    Write-Host "Powershell Version: $($PSVersionTable.PSVersion.ToString())"
    Set-ExitCodeAndExit -ExitCode 1001
}

try
{
    # Register resolver
    [Loader]::RegisterReflectionLoadResolver()
}
catch
{
    Write-Host "Resolver registration error at Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)" 
}

try
{
    # Evaluate
    $DeviceGuardStatus = Get-DeviceGuardStatus
    $PowershellPolicy = Check-PowershellPolicy
    $Results = Evaluate-ComObjectsGuidMismatch

    # Analyze results
    $HasComObjectGuidConflict = $Results.MismatchCount -gt 0

    try
    {
        $ResultsAsJson = $Results | ConvertTo-Json -Compress
    }
    catch
    {
        Write-Host "ConvertTo-Json error At Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
    }

    $RegistryResult = Write-ControlRegistryKeys -HasMismatchComObjects $HasComObjectGuidConflict  -ResultSuccess $Results.Success -PowershellPolicy $PowershellPolicy -DeviceGuardStatus $DeviceGuardStatus

    $ImmuneComTelemetryEventEtw = New-Object ImmuneComTelemetryEvent -Property @{
        DeviceGuardStatus = $DeviceGuardStatus
        PowershellPolicyCanConflict = $PowershellPolicy
        ClsidCheckEnv = Get-DotNetCOMPlusEnvironmentVariable
        HasComObjectGuidConflict = $HasComObjectGuidConflict
        AdditionalInfo = $ResultsAsJson
        AllowWdacControlsValue = $RegistryResult
    }

    $global:EtwProvider.Write("ImmuneComTelemetryEvent", $ImmuneComTelemetryEventEtw)

    try
    {
        Write-FinalStats
    }
    catch
    {
        # Dont write anything
    }

    Set-ExitCodeAndExit -ExitCode 1000
}
catch
{
    Write-Host "Unhandled errors at Line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)" 
    Set-ExitCodeAndExit -ExitCode 1003
}

# ExitCode   Description
# -1         Unexpected behavior
# 1000       Success
# 1001       Cannot Add Type
# 1002       Failed to write registry key
# 1003       Script had unhandled errors

# SIG # Begin signature block
# MIIoYwYJKoZIhvcNAQcCoIIoVDCCKFACAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDpZCZAvPjb/xFJ
# tttR0ehdF9rlETZ5yIj5sUX7CGHGtKCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
# F8dThPTzAAAAAAQ4MA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjQxMTE1MDAwMTIzWhcNMjUxMTEzMDAwMTIzWjCBlDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE+MDwGA1UEAxM1TWlj
# cm9zb2Z0IFdpbmRvd3MgRGVmZW5kZXIgQWR2YW5jZWQgVGhyZWF0IFByb3RlY3Rp
# b24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7XRtbYKag9kcj7xkU
# ngKJasJqOoGURz5mjsXKDgxWbKkHzjZn2dUlQetNwLN3RrR/2rrNhGM4Vour57xq
# L6MijWd6HfBkGZAl/h3ALhPLrertldZ0FhEzt/kLSsbx/2xq5Vwlt7RkRzwJSoeO
# 4jnXQUaG+dAb9mQW87vtDEARcKJqTTGB5W685hOyg4FWkb1nGPc4WgYE53Ri2XZv
# cCvuCsz5JmIbPjoQQHKomxaAr+wuea7o+r0M/bbm2Ok8v9LcX9bGx1ch515nXVkK
# PfCDQQbJ27pOlEEVOuu9WOHqs5zDCRO5Q4u6VrO/Q9+YF0snySMgsSJQ04BMeKDz
# uoHdAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBggrBgEFBQcDAwYKKwYBBAGCN0wv
# ATAdBgNVHQ4EFgQU02W11Adr5UTyXh234s3aOhbYszEwRQYDVR0RBD4wPKQ6MDgx
# HjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEWMBQGA1UEBRMNNDUxODk0
# KzUwMzM3MzAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8E
# TTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9N
# aWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBR
# BggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0
# cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAw
# DQYJKoZIhvcNAQELBQADggIBAJFkkzz+21rdOP2DeayTmrKJr3DK/NC2aKa+1TSl
# vaOVCWsqb1pcyqeLzUzCBuNCww5re19s/OESbO65iY3Ky7LquPeI8ZLWPugu8YRm
# 3s3rubr7d+GE0sx8NsOrkl4rfMpcweJ4grwFgrbvXDWEXvZBINlon7UIRsXB+oRH
# astYgbi5mV/1Y5s48vRHaErdlfJVPuyZ3cINFUM/FWMC2pQT17Qsc+76VR0JBC3W
# EHbj6bMkwNJ2881VAthRw2HuR+VSeDo4Qye+WDoq8YGo0wP1futayOCtQKv8ss8E
# E+PhNJhbojtwxKkrj4OspfPcUuna2bl0XFYWmMcK7Nd8ZF/yXEhOm1XQ+34d6KuA
# L3PvUm91X7Dp40jwMj1hMdpGi/p+SAOwzmeYMUw9+ZSaqrPDnDENSiiHCLayYN+E
# 3GMyo2Ha46Dhoop3jWnfMeTOIuY8hL5qiMeRg2WVHT3Y00UKThBnNo3XEf4zmpnx
# J4y/KDP+ntELIl52LLEQL5rzsGum6YRNxhySKbiimX9aj3zUFryeMk9WPgI1ACVG
# tflE5jeQ27eyOhdkwwYTOftQMhknSLXRbKe3q9FOraeYuORsBsyP+G29bnKPIZcs
# MkjsXy3N6HmJV/HYryosl9aaPejoITRumEuhwtt9zcVuCKwg/UY8nA2elYn6mwss
# 4NoRMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWlj
# cm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4
# MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBD
# QSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3Y
# bqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUB
# FDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnbo
# MlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT
# +OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuy
# e4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEh
# NSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2
# z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3
# s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78Ic
# V9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E
# 11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5P
# M4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcV
# AQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3
# FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBL
# hklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggr
# BgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsG
# AQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwA
# ZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0G
# CSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDB
# ZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc
# 8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYq
# wooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu
# 5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWI
# UUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXh
# j38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yH
# PgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtI
# EJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4Guzq
# N5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgR
# MiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQ
# zTGCGiIwghoeAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEC
# EzMAAAQ4THAXx1OE9PMAAAAABDgwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcN
# AQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUw
# LwYJKoZIhvcNAQkEMSIEIMasXMT8h1ZNF+e2XAbw9Uy0tVwafKk1hkDrz9OP/xxf
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAUH+MlhHhO15Q
# RRXps/TQvtzqIqgiwnI9Yvb/2wfsg4YGTxiBU2NtaPGjzpHZH09i5iEnGRtKEaVO
# QdqnEklG1UPdnsX9i8K7HIuWxiZeRgwby8WaW+VIbR3i4AiJk08GY61FxD2/Kb+c
# Cyn1x+7Wp1zcdXEAUhonZJZXEgMdPj0iGMr1H8yqqLvb/nSUTccbtIGVRCd1F6VR
# 0S3HAthNMiVvebLNIYFKvKga38PpMWg6482DKxb8etpt8y9HFgXxEN7BprGu+BWD
# HqEojQB0FZlgCWytgsj2icdow4cUTHrYj04Lz7xzp9VbjSIclKVeaf4ms/zo1XA7
# VjubO5WAVKGCF6wwgheoBgorBgEEAYI3AwMBMYIXmDCCF5QGCSqGSIb3DQEHAqCC
# F4UwgheBAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFZBgsqhkiG9w0BCRABBKCCAUgE
# ggFEMIIBQAIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCAFbCNJyzJO
# F/91OIICb4LE90Chb9isIbM7ed05lcBESQIGaC4aRWYYGBIyMDI1MDYwNTE0NDIz
# OC4yN1owBIACAfSggdmkgdYwgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMg
# TGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjQzMUEtMDVFMC1EOTQ3
# MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIR+zCCBygw
# ggUQoAMCAQICEzMAAAH6+ztE03czxtMAAQAAAfowDQYJKoZIhvcNAQELBQAwfDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWlj
# cm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjQwNzI1MTgzMTExWhcNMjUx
# MDIyMTgzMTExWjCB0zELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1pdGVk
# MScwJQYDVQQLEx5uU2hpZWxkIFRTUyBFU046NDMxQS0wNUUwLUQ5NDcxJTAjBgNV
# BAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2UwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQDKFlUEzc9lwF8SkB/t8giHKDBhVU/rhRJ5ltKVFHem
# 8l5u9rQtAINbjnI6u2nAikbIMZf4RsJseFLlN3gnRiVzzfO0sRttAPszqSpHReP6
# fzZwax79CcwfRZFkufCCAl16elDpRyIzicxhm91CPJsDip6M571jTvcmVe/dUht2
# RAfYkbJPygH8uy88v+QCcnjmhAintLHntE9D/Q7qprInZImvByMDxq4x0Cdko6LE
# WXOiiiHtLLJwjsEQ0dOmRUqtFXlh6VG9Y1ODWkfgQLYo7ZvGwE3bdu0x5O9kWJ4Y
# iv4PyZ/WVBCzQe3+0w5V1qHXi3tiT7GXk/hPDfF8AaAey+xrq6CvHCYpNNfWSpcf
# lcJ3DdNV4oJrHolX7KAzmLU2ugkrAEJbXU/CLTP+SL3Rl47pd8QT2YKcmbvpBzGL
# e2db9j/dm6YpDpf+JUgmjsuTRn+kBNHAAg2rB2/Ol21faE4mJvgZHyKzZukqSzTg
# a6t/B5Y+f3PqNjsYEL6OzylLAZ7Ct9/CABs0qbzZkMW+oEZBBUnAgdJemORL4bf1
# 7Jg4batwgsEgOXNTMwUUls2Hm0O/cZ4ncQq8Li81IDG0Z9ob+ZCErjdiN6+wHvYu
# i5TvyvG02G4xdLNoerl8WIbfNyxgdprj7D5iYyuFMTMPhICKyHfkGOhc/U/UK3hV
# rQIDAQABo4IBSTCCAUUwHQYDVR0OBBYEFGOMcpsvlZXqR3ToqhxAemEr1T+/MB8G
# A1UdIwQYMBaAFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMF8GA1UdHwRYMFYwVKBSoFCG
# Tmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY3Jvc29mdCUy
# MFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNybDBsBggrBgEFBQcBAQRgMF4w
# XAYIKwYBBQUHMAKGUGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvY2Vy
# dHMvTWljcm9zb2Z0JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3J0MAwG
# A1UdEwEB/wQCMAAwFgYDVR0lAQH/BAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQD
# AgeAMA0GCSqGSIb3DQEBCwUAA4ICAQC4VsKisWu+h0b5k0kfdj43PlClTK1BU5s7
# JgWuBwavGroxRrjIubE3jFZ0vWTKBpbkE5nfEGU9jtWm5/lvl5pc/upGrrXF46tf
# d/riQaJJahGL0QlrAlYLMl9RBFOEMvjPEjalhzXCc+ntDr3lserBnTZ5o4G52H8h
# 8SQZ7Q5+PohLejJmwk/XJq1ybiQGogfp1vX7B4zirjo2EB8B/TvTMXoX4ilQfKG0
# xtCDn5Ad867IHOu3rsKIwlIpwnecxXJ82We/rK+21jMsrfBL7RDAlSJstgkwjoUZ
# xK5HEqWrpGM6Er0vdA6OHRUIzXWsczXVmY3R64ltsEJV9AS584s2QbzwwUJQ0TXR
# JJsz86D8JtOSjQznBtW9AnoKosqO0dKh6gAY955fbh/lw9jJNwqVszouhR07Y/kl
# J0jmzUkX86fouJRPnRp2lGy1lqNtgR5f83tG9JuSfR2MPcG9PY5/dZ/2Ah5pAgdu
# /UnY78/lA49CJWjz7QAqbozRMo526KGErEC3/pjKTXsW/dEh2NPrCIvapEgSyA4m
# nd8gvDiZBE+7eylF9qRKhB7k3R7gdYV/xZbZkvT5zzdDOHdW0Q8jpjZ7YE795aFN
# hshsempgN8C0Bi1pgh17ztnKZcbcw7bBSOEv0e9JDOOiq6r46hSa98FRwHZ7kvpA
# Ic7qpM7tajCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUwDQYJKoZI
# hvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
# DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24x
# MjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eSAy
# MDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkGA1UEBhMC
# VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNV
# BAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
# bWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoIC
# AQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg4r25Phdg
# M/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aORmsHFPPF
# dvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41JmTamDu6
# GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5LFGc6XBp
# Dco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL64NF50Zu
# yjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9QZpGdc3E
# XzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj0XOmTTd0
# lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqEUUbi0b1q
# GFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0kZSU2LlQ
# +QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435UsSFF5PA
# PBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB3TCCAdkw
# EgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTEmr6CkTxG
# NSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwGA1UdIARV
# MFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNVHSUEDDAK
# BggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMC
# AYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvX
# zpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20v
# cGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYI
# KwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDANBgkqhkiG
# 9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4sQaTlz0x
# M7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th542DYunKmC
# VgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRXud2f8449
# xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBewVIVCs/wM
# nosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0DLzskYDS
# PeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+CljdQDzHVG2d
# Y3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFrDZ+kKNxn
# GSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFhbHP+Crvs
# QWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7ntdAoGokL
# jzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+oDEzfbzL
# 6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6FwZvKhggNW
# MIICPgIBATCCAQGhgdmkgdYwgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMg
# TGltaXRlZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjQzMUEtMDVFMC1EOTQ3
# MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYF
# Kw4DAhoDFQD3hn5tQmf6crAG8gjqyDQ3Lto8NqCBgzCBgKR+MHwxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBCwUAAgUA6+u1EDAiGA8yMDI1
# MDYwNTA2MTc1MloYDzIwMjUwNjA2MDYxNzUyWjB0MDoGCisGAQQBhFkKBAExLDAq
# MAoCBQDr67UQAgEAMAcCAQACAhxEMAcCAQACAhURMAoCBQDr7QaQAgEAMDYGCisG
# AQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMB
# hqAwDQYJKoZIhvcNAQELBQADggEBAEcMZ5OAL+wR75egN4Twq0b0/I4VgJyYq0XM
# NwQWC2p77x24jRLfmBoIL7zrlyund4BC78s55EA927/yk03N8VBKRJoN/+DRB4lr
# cYGac6VxYINmFlAOFrbM0tdHcHrQb1+kpmvzLhH90XXDjFIu8jdJ1dK7Mc7dtS+4
# CpMc2QDgu3YXTYBzhUUvjq4Gs/9B4oto3yuaPTN6GBgj83QnwqMDfRd2rdSVS0rd
# RhNS9iAt0ymwJnAAF/JELP+jhI8xQ+QTxwSTtJLTdqdUL6332a2Tgs/0gO0ZoeO+
# 1clYSPfOliMRKxfcQEPQa1MjcHiG2TE+aBp/r2PTRY+9sKGthMkxggQNMIIECQIB
# ATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAfr7O0TTdzPG
# 0wABAAAB+jANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3
# DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCA1Nuq0ZCOCm6Qh/Tv9OFfl2ZICIK4uh+sw
# VnGOZPNMBTCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIH3yfy3Jrz4HaONT
# 92klEjAfAcelyjmiA1K1ihxuQ55WMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3Rh
# bXAgUENBIDIwMTACEzMAAAH6+ztE03czxtMAAQAAAfowIgQg+GIIbsTtcM4lUXCQ
# dmTfnc4isukoR71k1KKdbLuQxGYwDQYJKoZIhvcNAQELBQAEggIACLvcFevTrTTs
# iyEFqLQGyBgnmmZDetx55SSvlOE94fv+k6Pr4t3E39fZHE4M29rpoUhWBOl3LcDz
# AhdDnhm/omS8pdph/5ZnLItVnFOUHQSL8UXjrxNmJNXmA0DtyCw+bW+4HcQHYwy+
# i21G1ApbWcqZsOImq2NmkBca20ZNpiq7WlfqaklKVoTGFGptrCGuru96iUkqkXd1
# ICgITh2kpWFYRXskPq1kIcIAq5BPIX+7LZNsi5+BJdPDb4Jb1TB4dv7KP2LBsAIr
# erfUAnEZXuTrrdQWdaBdWJrm8RA59nzv+AyWgI87tARfxLWtnSbiKGOxzLY2yh+V
# 8mj6aq0cagvYiUAjdlYwKLrpwYss8L4v+lpaeZLoHkDdHFT72EE40EACDDd2okUk
# 8ZQzf2TtdaIEhWf7W4j7AOApvaPnLgWQXtU7dUXDZ5+MunH78nAxOksaC8xe8DBs
# gs3sOqTfSy8X0YvCTaT6SNE4+n/xMhV4MgiO76OjtSGLEKuxh/XgDcUX3lDMvkRf
# oSNrd+YbQOe98csjWvOQuf4EY4GcCACuebeXmS1HN9URmklQ2NaM9/dd0uECRpZH
# Xo0niL5yOPQyYPtqzuLd8PASpvy5rLFna961mIWefple3GLFOfWXA/RxJK3mQyKF
# 3D2TvxVaaecoY9EnqCd9GiqhuI6sPX8=
# SIG # End signature block
