function Get-LastLogEntry {
    <#
    .SYNOPSIS
    Get text from log file that matches the specified pattern
    
    .DESCRIPTION
    Returns a line of text or part of it from CBB log file that matches the specified RegEx pattern.
    
    .PARAMETER FullPathToLog
    Full path to log file

    .PARAMETER Pattern
    RegEx pattern to search for in log file (case sensitive).
    
    .PARAMETER ReturnMatchGroup
    Index number that corresponds to a match group in the RegEx pattern. The function will return only the part of the line, that is in the specified match group.

    .EXAMPLE
    Get-LastLogEntry -FullPathToLog "C:\ProgramData\Online Backup\Logs\af8928ca-5934-4848-b8b1-159486fb58f0.log" -Pattern "^(.*)NOTICE - Plan: (.*). Type: (.*). Start mode: (.*)$" -ReturnMatchGroup 4
    
    .INPUTS
    None

    .OUTPUTS
    System.String

    .NOTES
    Author: MSP360 Onboarding Team
    
    .LINK

    #>

    [cmdletbinding()]
    param(
        [parameter(Mandatory=$true)]
        [string]$FullPathToLog,
        [parameter(Mandatory=$true)]
        [string]$Pattern,
        [parameter(Mandatory=$false)]
        [int]$ReturnMatchGroup = 0
    )

    begin {
    }

    process {
        if (Test-Path -Path $FullPathToLog -PathType leaf) {
            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Log file $FullPathToLog exists."
            $LogContent = Get-Content -Path $FullPathToLog
            $i = 0
            do {
                $i = $i + 1
                $MatchFound = $($LogContent[-$i] -cmatch $Pattern)
            } until (($MatchFound) -or ($i -eq $LogContent.Count))
            if ($MatchFound) {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Found line matching rexeg expression. Line:$($LogContent.Count - $i + 1)"
                $result = $Matches[$ReturnMatchGroup]
            } else {
                Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): No lines matching regex pattern found. Checked $i lines."
                $result = ""
            }
        }
        else {
            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Log file $FullPathToLog not found."
            $result = ""
        }
    }

    end {
        return $result
    }
}
# SIG # Begin signature block
