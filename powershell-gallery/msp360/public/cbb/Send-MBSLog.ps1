function Send-MBSLog {
    <#
    .SYNOPSIS
    Send logs to MSP360 Support Team
    
    .DESCRIPTION
    Collect logs from the backup agent and send them to MSP360 Support Team with an option of specifying a description message and existing ticket number
    
    .PARAMETER UserName
    First/last name
    
    .PARAMETER EmailAddress
    Email address
    
    .PARAMETER Message
    Description of the issue, which will help MSP360 Support Team to resolve the issue

    .PARAMETER TicketNumber
    Ticket number, if exists

    .EXAMPLE
    Send-MBSLog -UserName "Customer" -EmailAddress "backup@infrastructure.com"

    Sends logs from the backup agent. MSP360 Support Team will see that the logs were sent from user "Customer" with email address "backup@infrastructure.com"
    
    .EXAMPLE
    Send-MBSLog -UserName "Customer" -EmailAddress "backup@infrastructure.com" -Message "Logs as requested" -TicketNumber "00043067"

    Sends logs from the backup agent. MSP360 Support Team will see that the logs were sent from user "Customer" with email address "backup@infrastructure.com". Also, the MSP360 Support Team will see the message "Logs as requested" and the logs will be attached to an open case with ticket number 00043067.

    .INPUTS
    None

    .OUTPUTS
    None

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/send-mbslog
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, HelpMessage="First/last name")]
        [String]
        $UserName,
        [Parameter(Mandatory=$true, HelpMessage="Email address")]
        [String]
        $EmailAddress,
        [Parameter(Mandatory=$false, HelpMessage="Description message that will be attached to the logs")]
        [String]
        $Message,
        [Parameter(Mandatory=$false, HelpMessage="If exists and specified, the logs will be attached to an open case with this ticket number")]
        [String]
        $TicketNumber
    )
    
    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
    }
    
    process {
        $Arguments = " sendLog -u ""$UserName"" -e $EmailAddress"
        if ($Message){$Arguments += " -m ""$Message"""}
        if ($TicketNumber){$Arguments += " -t $TicketNumber"}
        
        $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output none
    }
    
    end {
        
    }
}
# SIG # Begin signature block
