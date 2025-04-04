function Add-WFUMonitoringJob {
    <#
    .SYNOPSIS
        Add status monitoring task to windows task scheduler for Windows Firewall, Windows Defender, Third party antivirus, and Windows Update Services.
    .DESCRIPTION
        Admin permissions are required.
    .EXAMPLE
        PS C:\> .\Add-WFUMonitoringJob.ps1 `
        -JobUserName "Domain\MyUser" `
        -JobUserPwd 'MyUserPassword' `
        -MessageFrom "My_email@gmail.com" `
        -MessageTo "My_email@gmail.com" `
        -MessageSMTPServer "smtp.gmail.com" `
        -MessagePort 587 `
        -MessageUseSSL $true `
        -MessageUserName "My_email@gmail.com" `
        -MessageCredsPassword 'MyEmailPassword'

        Add monitoring task with default options. Specify mandatory parameters only.
    .EXAMPLE
        PS C:\> .\Add-WFUMonitoringJob.ps1 `
        -JobName "Monitoring Windows Security services" `
        -JobUserName "domain\user" `
        -JobUserPwd 'MyUserPassword' `
        -MessageFrom "My_email@gmail.com" `
        -MessageTo "My_Email@gmail.com" `
        -MessageSubject "Security Alert" `
        -MessageSMTPServer smtp.gmail.com `
        -MessagePort 587 `
        -MessageUseSSL $true `
        -MessageUserName "My_email@gmail.com" `
        -MessageCredsPassword 'MyEmailPassword' `
        -IsFirewallMonitored $true `
        -IsWindowsDefenderMonitored $true `
        -Is3PartyAntivirusMonitored $False `
        -IsWindowsUpdateMonitored $True `
        -WindowsUpdateNotificationLevel 3 `
        -MonitoringJobSchedule (New-ScheduledTaskTrigger -At 07:00:00 -Daily)

        Add monitoring task for Windows Firewall, Windows Defender and Windows Update services only.
    .INPUTS
        None
    .OUTPUTS
        Microsoft.Management.Infrastructure.CimInstance#Root/Microsoft/Windows/TaskScheduler/MSFT_ScheduledTask
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/tools/add-wfumonitoringjob
    #>

    [CmdletBinding()]
    param (
        # Task scheduler monitoring job name
        [Parameter(Mandatory=$False)]
        [string]$JobName = "Monitor Windows Security services" ,
        # Local admin username.
        [Parameter(Mandatory=$True)]
        [string]$JobUserName,
        # Local admin password
        [Parameter(Mandatory=$True)]
        [string]$JobUserPwd,
        # Sender email address
        [Parameter(Mandatory=$True)]
        [string]$MessageFrom,
        # Recepient email address
        [Parameter(Mandatory=$True)]
        [string]$MessageTo,
        # Email subject
        [Parameter(Mandatory=$False)]
        [string]$MessageSubject = "Security Alert",
        # SMTP server address
        [Parameter(Mandatory=$True)]
        [string]$MessageSMTPServer,
        # SMTP server port
        [Parameter(Mandatory=$True)]
        [int32]$MessagePort,
        # Use SSL?
        [Parameter(Mandatory=$True)]
        [bool]$MessageUseSSL,
        # SMTP server user
        [Parameter(Mandatory=$True)]
        [string]$MessageUserName,
        # SMTP server user password
        [Parameter(Mandatory=$True)]
        [string]$MessageCredsPassword,
        # Set $true to monitor Firewall settings or $false to skip
        [Parameter(Mandatory=$False)]
        [bool]$IsFirewallMonitored = $true,
        # Set $true to monitor Windows Defender settings or $false to skip
        [Parameter(Mandatory=$False)]
        [bool]$IsWindowsDefenderMonitored = $true,
        # Set $true to monitor 3 party antivirus settings or $false to skip
        [Parameter(Mandatory=$False)]
        [bool]$Is3PartyAntivirusMonitored = $true,
        # Set $true to monitor Windows Update service or $false to skip
        [Parameter(Mandatory=$False)]
        [bool]$IsWindowsUpdateMonitored = $true,
        # Sends email if notification level equal or less than the specified number. {0='Not configured'; 1='Never check for updates'; 2='Check for updates but let me choose whether to download and install them'; 3='Download updates but let me choose whether to install them'; 4='Install updates automatically'}
        [Parameter(Mandatory=$False)]
        [int32]$WindowsUpdateNotificationLevel = 3,
        # Get more about task trigger https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/new-scheduledtasktrigger
        [Parameter(Mandatory=$False)]
        $MonitoringJobSchedule = (New-ScheduledTaskTrigger -At 07:00:00 -Daily)
    )

    
    begin {
        
    }
    
    process {
        $MessageCredsPassword = $MessageCredsPassword | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString
        $Script = "
        `$MessagePwd = '$MessageCredsPassword' | ConvertTo-SecureString
        `$MessageCreds = New-Object System.Management.Automation.PSCredential -ArgumentList $MessageUserName, `$MessagePwd
        `$AutoUpdateNotificationLevels= @{0='Not configured'; 1='Never check for updates' ; 2='Check for updates but let me choose whether to download and install them'; 3='Download updates but let me choose whether to install them'; 4='Install updates automatically'}
        `$FirewallStatus = Get-NetFirewallProfile | Select -property Name, Enabled
        try {`$AVStatus = Get-MpComputerStatus | select -Property RealTimeProtectionEnabled, OnAccessProtectionEnabled, NISEnabled, IoavProtectionEnabled, BehaviorMonitorEnabled, AntivirusEnabled, AntispywareEnabled}
            catch { `$NoAntivirusDetected = `$true }
        try{`$AV3PartyStatus = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | where {`$_.displayName -ne 'Windows Defender'};`$AV3PartyProductState = '{0:x}' -f `$AV3PartyStatus.productState}
            catch{`$No3PartyAntivirusDetected = `$true }

        `$AVStatus = Get-MpComputerStatus | select -Property RealTimeProtectionEnabled, OnAccessProtectionEnabled, NISEnabled, IoavProtectionEnabled, BehaviorMonitorEnabled, AntivirusEnabled, AntispywareEnabled  
        `$WUStatus = get-service wuauserv | select -Property name, starttype, status
        `$WUStatusLevel = (New-Object -com 'Microsoft.Update.AutoUpdate').Settings.NotificationLevel

        if ((`$$IsFirewallMonitored -and (-not `$FirewallStatus[0].Enabled)) -or (`$$IsFirewallMonitored -and (-not `$FirewallStatus[1].Enabled)) -or (`$$IsFirewallMonitored -and (-not `$FirewallStatus[2].Enabled)) -or (`$$IsWindowsDefenderMonitored -and (-not `$AVStatus.RealTimeProtectionEnabled)) -or (`$$IsWindowsDefenderMonitored -and (-not `$AVStatus.OnAccessProtectionEnabled)) -or (`$$IsWindowsDefenderMonitored -and (-not `$AVStatus.NISEnabled)) -or (`$$IsWindowsDefenderMonitored -and (-not `$AVStatus.IoavProtectionEnabled)) -or (`$$IsWindowsDefenderMonitored -and (-not `$AVStatus.BehaviorMonitorEnabled)) -or (`$$IsWindowsDefenderMonitored -and (-not `$AVStatus.AntivirusEnabled)) -or (`$$IsWindowsDefenderMonitored -and (-not `$AVStatus.AntispywareEnabled)) -or (`$$IsWindowsUpdateMonitored  -and (-not(`$WUStatus.StartType -ne 'Disabled'))) -or (`$$IsWindowsUpdateMonitored  -and (-not(`$WUStatusLevel -gt $WindowsUpdateNotificationLevel))) -or (`$$Is3PartyAntivirusMonitored  -and (-not(`$AV3PartyProductState[`$AV3PartyProductState.length - 4] -ne '1'))) -or (`$$Is3PartyAntivirusMonitored  -and (-not(`$AV3PartyProductState[`$AV3PartyProductState.length - 2] -ne '0')))){
            if(`$$IsFirewallMonitored){
                `$MessageBody = ""<H3>Windows Firewall Profile Status</H3>""
                if(`$FirewallStatus[0].Enabled){`$MessageBody += ""<b>Domain: </b><font color=green>Enabled</font><br>""}else{`$MessageBody +=""<b>Domain: </b><font color=red>Disabled</font><br>""}
                if(`$FirewallStatus[1].Enabled){`$MessageBody += ""<b>Private: </b><font color=green>Enabled</font><br>""}else{`$MessageBody +=""<b>Private: </b><font color=red>Disabled</font><br>""}
                if(`$FirewallStatus[2].Enabled){`$MessageBody += ""<b>Public: </b><font color=green>Enabled</font><br>""}else{`$MessageBody +=""<b>Public: </b><font color=red>Disabled</font><br>""}

            }
            if(`$$IsWindowsDefenderMonitored){
                `$MessageBody += ""<H3>Windows Defender Protection Status</H3>""
                if(-not (`$NoAntivirusDetected)){
                    if(`$AVStatus.RealTimeProtectionEnabled){`$MessageBody += ""<b>RealTimeProtection: </b><font color=green>Enabled</font><br>""}else{`$MessageBody +=""<b>RealTimeProtection: </b><font color=red>Disabled</font><br>""}
                    if(`$AVStatus.OnAccessProtectionEnabled){`$MessageBody +=  ""<b>OnAccessProtection: </b><font color=green>Enabled</font><br>""}else{`$MessageBody += ""<b>OnAccessProtection: </b><font color=red>Disabled</font><br>""}
                    if(`$AVStatus.NISEnabled){`$MessageBody += ""<b>NIS: </b><font color=green>Enabled</font><br>""}else{`$MessageBody +=""<b>NIS: </b><font color=red>Disabled</font><br>""}
                    if(`$AVStatus.IoavProtectionEnabled){`$MessageBody += ""<b>IoavProtection: </b><font color=green>Enabled</font><br>""}else{`$MessageBody +=""<b>IoavProtection: </b><font color=red>Disabled</font><br>""}
                    if(`$AVStatus.BehaviorMonitorEnabled){`$MessageBody += ""<b>BehaviorMonitor: </b><font color=green>Enabled</font><br>""}else{`$MessageBody +=""<b>BehaviorMonitor: </b><font color=red>Disabled</font><br>""}
                    if(`$AVStatus.AntivirusEnabled){`$MessageBody += ""<b>Antivirus: </b><font color=green>Enabled</font><br>""}else{`$MessageBody +=""<b>Antivirus: </b><font color=red>Disabled</font><br>""}
                    if(`$AVStatus.AntispywareEnabled){`$MessageBody += ""<b>Antispyware: </b><font color=green>Enabled</font><br>""}else{`$MessageBody += ""<b>Antispyware: </b><font color=red>Disabled</font><br>""}
                }else{
                    `$MessageBody += ""<b>No Antivirus detected</b>""
                }
            }
            if(`$$Is3PartyAntivirusMonitored){
                
                if(`$AV3PartyStatus){
                    `$MessageBody += ""<H3>""+`$AV3PartyStatus.displayName+"" Protection Status</H3>""
                    if(`$AV3PartyProductState[`$AV3PartyProductState.length - 4] -eq '1'){`$MessageBody += ""<b>Antivirus status: </b><font color=green>Enabled</font><br>""}else{`$MessageBody += ""<b>Antivirus: </b><font color=red>Disabled</font><br>""}
                    if(`$AV3PartyProductState[`$AV3PartyProductState.length - 2] -eq '0'){`$MessageBody += ""<b>Antivirus databases: </b><font color=green>Up to date</font><br>""}else{`$MessageBody += ""<b>Antivirus databases: </b><font color=red>Outdated</font><br>""}
                }else{
                    `$MessageBody += ""<H3>Third Party Antivirus Protection Status</H3>""
                    `$MessageBody += ""<b>No Antivirus detected</b>""
                }
            }
            if(`$$IsWindowsUpdateMonitored ){
                `$MessageBody += ""<H3>Windows Update Service Status</H3>""
                if(`$WUStatus.starttype -ne 'Disabled'){`$MessageBody += ""<b>Start type: </b><font color=green>""+`$WUStatus.starttype+""</font><br>""}else{`$MessageBody +=""<b>Start type: </b><font color=red>Disabled</font><br>""}
                if(`$WUStatusLevel -gt $WindowsUpdateNotificationLevel){`$MessageBody += ""<b>Notification Level: </b><font color=green>""+`$AutoUpdateNotificationLevels[`$WUStatusLevel]+""</font><br>""}else{`$MessageBody +=""<b>Notification Level: </b><font color=red>""+`$AutoUpdateNotificationLevels[`$WUStatusLevel]+""</font><br>""}
            }
            
            Send-MailMessage -From "+$MessageFrom+" -To "+$MessageTo+" -Subject ""`$env:computername $MessageSubject"" -Body `$MessageBody -SmtpServer "+$MessageSMTPServer+" -UseSsl:$"+$MessageUseSSL+" -Port "+$MessagePort+" -Credential `$MessageCreds -BodyAsHtml}"

        $encoded = [Convert]::ToBase64String([System.Text.Encoding]::Unicode.GetBytes($Script))
        $action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "-NoProfile -WindowStyle Hidden -encodedCommand $encoded"
        if(Get-ScheduledTask -TaskName $JobName -ErrorAction SilentlyContinue) {Unregister-ScheduledTask -TaskName $JobName -Confirm:$false}
        Register-ScheduledTask -Action $action -Trigger $MonitoringJobSchedule -TaskName $JobName -User $JobUserName -password $JobUserPwd
    }
    
    end {
        
    }
}

# SIG # Begin signature block
