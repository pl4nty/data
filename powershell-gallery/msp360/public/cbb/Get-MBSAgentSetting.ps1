function Get-MBSAgentSetting {
    <#
    .SYNOPSIS
        Get MBS agent settings.
    .DESCRIPTION
        The Get-MBSAgentSetting cmdlet returns PS custom object with MBS agent settings.
    .EXAMPLE
        PS C\:> Get-MBSAgentSetting
        Get MBS agent settings.
    .INPUTS
        None
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbsagentsetting
    #>

    [CmdletBinding()]
    param (
        
    )
    
    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
    }
    
    process {
        if ($CBBProgramData = $CBB.CBBProgramData) {
            if (Test-Path -Path "$CBBProgramData\enginesettings.list" -PathType leaf) {
                try {
                    $enginesettings = [xml](Get-Content ("$CBBProgramData\enginesettings.list"))
                    $MBSAgentSettings = Convert-XMLtoPSObject $enginesettings.EngineSettings
                    return $MBSAgentSettings | Select-Object -Property * -ExcludeProperty xsd, xsi, Accounts, CBLPassword, MBSPassword, TestMode
                }
                catch {
                    Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): ""enginesettings.list"" is empty or incorrect format"
                }
            } else {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): ""enginesettings.list"" is missing in folder ""$CBBProgramData"""
            }
        }
    }
    
    end {
        
    }
}

# SIG # Begin signature block
