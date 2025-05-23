function Get-MBSAgent {
    <#
    .SYNOPSIS
        Get MBS backup agent parameters
    .DESCRIPTION
        Gets the information about MBS backup agent settings, paths, etc. By default, the function pulls the registry values of the installed MBS backup agent and parses additional values.
        The properties from registry path UninstallKey are fetched dynamically. If the software will add new keys, they can be listed by the function.
        If global variables $MSP360ModuleSettings.CBBPath and $MSP360ModuleSettings.CBBProgramData are specified, the function tests the paths and includes only them and $CBBCLIPath in the resulting object.
    .EXAMPLE
        Get-MBSAgent

        Lists all of the parameters on the system into an object
    .INPUTS
        None.
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbsagent
    #>
    
    [CmdletBinding()]
    param (
    
    )

    if ($global:MSP360ModuleSettings.CBBPath -And $global:MSP360ModuleSettings.CBBProgramData) {
        Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Global variables defined"
        $CBBPath = $global:MSP360ModuleSettings.CBBPath
        $CBBProgramData = $global:MSP360ModuleSettings.CBBProgramData
        $CBBCLIPath = $CBBPath+"\cbb.exe"
    } else {
        #Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Requesting information from registry"
        if ($null -eq ((Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" -Name "UninstallKey" -ErrorAction SilentlyContinue).'UninstallKey')) {
            Write-Error "ERROR: Online backup agent is not installed on this machine."
            return $false
        }

        #$UninstallPath = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}"
        $UninstallKey = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" -Name "UninstallKey")."UninstallKey"
        $ProviderID = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{07BCB989-197A-4E3D-852D-DE8363860401}" -Name "ProviderID")."ProviderID"
        $FullPath = (Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\$UninstallKey" -Name "(default)")."(default)"
        $RegistryEntries = Get-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\$UninstallKey"
        $HID = (Get-ItemProperty -Path "Registry::HKEY_CLASSES_ROOT\CLSID\{BA3D137D-C8B4-4e54-BAD8-35BC178821D9}" -Name "id")."id"
        $CBBPath = $FullPath.Substring(0, $FullPath.LastIndexOf('\'))
        $CBBName = $FullPath.Substring($CBBPath.Length+1) -replace ".{4}$"
        $CBBCompany = $RegistryEntries.Publisher
        $CBBCLIPath = $CBBPath+"\cbb.exe"
        
        if ($global:MSP360ModuleSettings.SkipEngineSettingsListCheck) {
            Write-Verbose "MSP360ModuleSettings.SkipEngineSettingsListCheck is set. Setting default value for the program data folder"
            $CBBProgramData = "$env:ProgramData\Online Backup"
        } else {
            if (Test-Path -Path "$env:ProgramData\Online Backup\enginesettings.list" -PathType leaf) {
                $CBBProgramData = "$env:ProgramData\Online Backup"
            }
            elseif (Test-Path -Path "$env:ProgramData\$CBBCompany\enginesettings.list" -PathType leaf) {
                $CBBProgramData = "$env:ProgramData\$CBBCompany"
            } else {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): ""enginesettings.list"" not found"
                $CBBProgramData = ""
            }
        }
    }

    $MBSAgent = New-Object -TypeName psobject

    if ($global:MSP360ModuleSettings.CBBPath -And $global:MSP360ModuleSettings.CBBProgramData) {
        if (-Not (Test-Path -Path "$CBBCLIPath" -PathType leaf)) {
            Write-Error "ERROR: $CBBPath does not exist."
            return $false
        }
        if ($global:MSP360ModuleSettings.SkipEngineSettingsListCheck) {
            Write-Verbose "MSP360ModuleSettings.SkipEngineSettingsListCheck is set. Forcibly setting ""$CBBProgramData"" as the program data folder"
        } else {
            if (-Not (Test-Path -Path "$CBBProgramData\enginesettings.list" -PathType leaf)) {
                Write-Error "ERROR: $CBBProgramData does not exist."
                return $false
            }
        }
        $CBBCLIVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($CBBCLIPath).FileVersion
        $MBSAgent | Add-Member -MemberType NoteProperty -Name Version -Value $CBBCLIVersion
    } else {
        $MBSAgent | Add-Member -MemberType NoteProperty -Name UninstallKey -Value $UninstallKey
        $MBSAgent | Add-Member -MemberType NoteProperty -Name ProviderID -Value $ProviderID
        $MBSAgent | Add-Member -MemberType NoteProperty -Name FullPath -Value $FullPath
        $RegistryEntries | Get-Member -MemberType NoteProperty | ForEach-Object {
            if (($_.Name -ne "(default)") -And ($_.Name -ne "PSChildName") -And ($_.Name -ne "PSParentPath") -And ($_.Name -ne "PSPath") -And ($_.Name -ne "PSProvider")) {
                $PropertyName = $_.Name
                $MBSAgent | Add-Member -MemberType NoteProperty -Name $PropertyName -Value $RegistryEntries.$PropertyName
            }
        }
        
        $MBSAgent | Add-Member -MemberType NoteProperty -Name HID -Value $HID
        $MBSAgent | Add-Member -MemberType NoteProperty -Name CBBName -Value $CBBName
    }

    $MBSAgent | Add-Member -MemberType NoteProperty -Name CBBPath -Value $CBBPath
    $MBSAgent | Add-Member -MemberType NoteProperty -Name CBBCLIPath -Value $CBBCLIPath
    $MBSAgent | Add-Member -MemberType NoteProperty -Name CBBProgramData -Value $CBBProgramData
    
    return $MBSAgent
}

Set-Alias gma Get-MBSAgent
# SIG # Begin signature block
