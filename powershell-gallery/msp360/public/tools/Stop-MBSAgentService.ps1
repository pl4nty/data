function Stop-MBSAgentService {
    <#
    .SYNOPSIS
        Stop MBS Agent services
    .DESCRIPTION
        Stop Online Backup Service and Online Backup Remote Management Service regardless of their actual names, which can be different because of branding settings.
    .EXAMPLE
        Stop-MBSAgentService

        Stops the MBS Agent backup and remote management services.
    .INPUTS
        None
    .OUTPUTS
        None
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/tools/stop-mbsagentservice
    #>
    
    [CmdletBinding()]
    param (
    )

    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }

        $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
        $IsAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
        Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Started as administrator: $IsAdmin"
        if (-not($IsAdmin)) {
            Write-Error "ERROR: Administrator privileges are required to run this cmdlet"
            Break
        }
    }

    process {
        $CBBService = Get-CimInstance Win32_Service | Where-Object {($_.PathName -like ("*" + $CBB.CBBPath + "\Cloud.Backup.Scheduler.exe*")) -And (-Not ($_.Name -eq "CloudBerry Backup Service"))}
        $CBBRMService = Get-CimInstance Win32_Service | Where-Object {$_.PathName -like ("*" + $CBB.CBBPath + "\Cloud.Backup.RM.Service.exe*")}
        $CBBRMService | Stop-Service
        $CBBService | Stop-Service
        Write-Host "Command to stop Online Backup services was sent successfully"
    }
    
    end {
    }
}
# SIG # Begin signature block
