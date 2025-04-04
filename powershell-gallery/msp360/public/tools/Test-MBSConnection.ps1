function Test-MBSConnection {
    <#
    .SYNOPSIS
        TCP port connection test to MBS servers
    .DESCRIPTION
        Connection test allows you to check connection from your computer to MBS servers. Connection failing indicates firewall misconfiguration.
    .EXAMPLE
        PS C:\> Test-MBSConnection

        Test connection to IP addresses and ports associated with Management Console.
    .INPUTS
        None
    .OUTPUTS
        System.String[]
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/tools/test-mbsconnection
    #>

    [CmdletBinding()]
    param (
        
    )

    begin {
        $MBSServers = @( 
            ("52.6.7.137","443"),
            ("52.5.40.159","443"),
            ("52.20.40.101","443"),
            ("3.216.171.162","443"),
            ("3.216.236.203","443")
        )
    }
    
    process {
        function Check-MBSConnectionTestResult ($MBSServer) {
            Write-Host "Testing connection to " $MBSServer[0]":"$MBSServer[1]": " -NoNewline
            $Result = Test-NetConnection $MBSServer[0] -Port $MBSServer[1] -WarningAction SilentlyContinue
            if ($Result.TcpTestSucceeded){
                Write-Host "OK" -ForegroundColor Green
            } else {
                Write-Host "Fail" -ForegroundColor Red
            }
            #Write-HostAndLog -Message $Result -FilePath tnc.txt -showMessage $False
        }

        Write-Host "Running connection test to MBS. It can take up to 5 minutes. Please wait..." 
        #Write-HostAndLog -Message "*********************************$env:computername************************" -FilePath tnc.txt -showMessage $False
        foreach ($MBSServer in $MBSServers) {
            Check-MBSConnectionTestResult ($MBSServer)
        }
    }
    
    end {
        Write-Host "Connection test is completed"
    }
}

# SIG # Begin signature block
