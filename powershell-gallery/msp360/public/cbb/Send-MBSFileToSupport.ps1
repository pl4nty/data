function Send-MBSFileToSupport {
    <#
    .SYNOPSIS
    Sends specified file to support team
    
    .DESCRIPTION
    This cmdlet  sends a file by a specified path to support team
    
    .PARAMETER Path
    Path to file you want to send
    
    .PARAMETER TicketNumber
    Ticket number
    
    .EXAMPLE
    Send-MBSFileToSupport -Path "C:\TestFolder\test.txt" -TicketNumber 9999999
    
    Sends a file test.txt from the local folder C:\TestFolder to support team.
    
    .INPUTS
    None

    .OUTPUTS
    String

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/send-mbsfiletosupport
    #>

    [CmdletBinding()]
    param (
        # Parameter - Specify path to file you want to send
        [Parameter(Mandatory=$true, HelpMessage="Specify path to file you want to send")]
        [string]
        $Path,
        # Parameter - Ticket number
        [Parameter(Mandatory=$true, HelpMessage="Specify a ticket number")]
        [string]
        $TicketNumber#,
        # Parameter - Master password
        #[Parameter(Mandatory=$false, HelpMessage="Specify Master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        #[SecureString]
        #$MasterPassword
    )
    
    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
    }
    
    process {
        $Arguments = "sendFileToSupport -p $Path -t $TicketNumber"
        $Process = (Start-MBSProcess -cmdpath $CBB.CBBCLIPath -cmdarguments $Arguments).stdout
        $Process.split([Environment]::NewLine) | ForEach-Object -Process {
            if ($_ -match 'WARNING: \w*') {
                Write-Warning -Message $_.replace("WARNING: ","")
            } elseif ($_ -match 'ERROR: \w*') {
                Write-Error -Message $_.replace("ERROR: ","")
            } 
        }
    }
    
    end {
        
    }
}
# SIG # Begin signature block
