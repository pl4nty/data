function Save-MBSLog {
    <#
    .SYNOPSIS
    Save the log files to specific path.
    
    .DESCRIPTION
    Save the log files to specific path.
    
    .PARAMETER Path
    Specifies the directory to which to save the application logs. Ommit to save to the default folder (C:\Users\USER_NAME\Documents\)
    
    .EXAMPLE
    Save-MBSLog

    Save logs to the default directory.

    .EXAMPLE
    Save-MBSLog -Path C:\Temp

    Save logs to the "C:\Temp" directory.
    
    .INPUTS
    None.

    .OUTPUTS
    System.String[]

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/save-mbslog
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$False, HelpMessage="Specifies the directory to which to save the application logs. Ommit to save to the default folder (C:\Users\USER_NAME\Documents\)")]
        [string]
        $Path
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
        $Arguments = " savelog"
        if ($Path){$Arguments += " -p ""$Path"""}

        $Result = Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output none
        $Result.stdout.split([Environment]::NewLine)| ForEach-Object -Process {
            if ($_ -match 'WARNING: \w*') {
                Write-Warning -Message $_.replace("WARNING: ","")
            } elseif ($_ -match 'ERROR: \w*') {
                Write-Error -Message $_.replace("ERROR: ","")
            } elseif ($_) {
                if ($_ -notmatch ".*Command Line Interface started.*") {
                    $ReturnResult += $_
                }
            }
        }
        return $ReturnResult
    }
    
    end {
        
    }
}
# SIG # Begin signature block
