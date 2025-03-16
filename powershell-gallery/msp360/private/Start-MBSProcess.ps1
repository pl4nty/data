function Start-MBSProcess {
    <#
    .SYNOPSIS
        Start exe with arguments and get result
    .DESCRIPTION
        Start exe with arguments and get result
    .EXAMPLE
        PS C:\> Start-MBSProcess -CMDPath (Get-MBSAgent).CBBClipath -CMDArguments "nwclist -s" -Output json -MasterPassword (ConvertTo-SecureString -string "1234" -AsPlainText -Force)
        
        Errors                        Warnings Result
        ------                        -------- ------
        {Master password is invalid.} {}       Fail  

    .EXAMPLE
        PS C:\> (Start-MBSProcess -CMDPath (Get-MBSAgent).cbbClipath -CMDArguments "nwclist -s" -Output json -MasterPassword (ConvertTo-SecureString -string "123" -AsPlainText -Force)).Share


        Available  Login      Share
        ---------  -----      -----
        Not tested dev\alex.v \\hermes\10tb_share

    .INPUTS
        None
    .OUTPUTS
        PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    #>

    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $CMDPath,
        [Parameter()]
        [string]
        $CMDArguments,
        [Parameter()]
        [securestring]
        $MasterPassword,
        [Parameter()]
        [ValidateSet("json","short","full","none")]
        [string]
        $Output
    )
    
    begin {
        
    }
    
    process {
        $ProcessStartInfo = New-Object System.Diagnostics.ProcessStartInfo
        $ProcessStartInfo.FileName = $CMDPath
        $ProcessStartInfo.RedirectStandardError = $true
        $ProcessStartInfo.RedirectStandardOutput = $true
        $ProcessStartInfo.UseShellExecute = $false
        
        if ($MasterPassword) {
            $CMDArguments += " -mp """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($MasterPassword)))+""""
        }

        if (($Output -eq "short") -And ($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent)) {$Output = "full"}

        switch ($Output) {
            json {$CMDArguments += " -json"}
            short {$CMDArguments += " -output short"}
            full {$CMDArguments += " -output full"}
            Default {}
        }

        Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): Arguments: $(((((($CMDArguments -replace  '-mp "\w*"','-mp "****"') -replace '-p "\w*"','-p "****"') -replace '-cp "\w*"','-cp "****"') -replace '-c "\w*"','-c "****"') -replace '-password "\w*"','-password "****"') -replace  '-ep "\w*"','-ep "****"')"
        $ProcessStartInfo.Arguments = $CMDArguments
        $Process = New-Object System.Diagnostics.Process
        $Process.StartInfo = $ProcessStartInfo
        $Process.Start() | Out-Null
        $Process.WaitForExit()

        if ($Output -eq "json") {
            $result = $Process.StandardOutput.ReadToEnd().replace("Content-Type: application/json; charset=UTF-8","") |ConvertFrom-Json
            if($null -ne $result){
                if ($result.Result -ne "Success" -and $null -ne $result.Result) {
                    if ('' -ne $result.Warnings) {
                        $result.Warnings | ForEach-Object -Process {
                            Write-Warning -Message $_
                        }
                    }
                    if ('' -ne $result.Errors) {
                        $result.Errors | ForEach-Object -Process {
                            Write-Error -Message $_
                        }
                    }
                }
            }
        } elseif (($Output -eq "short") -or ($Output -eq "full")) {
            $result = New-Object -TypeName MBS.Agent.CLIResult
            $Process.StandardOutput.ReadToEnd().split([Environment]::NewLine) | ForEach-Object -Process {
                if ($_ -match 'WARNING: \w*') {
                    Write-Warning -Message $_.replace("WARNING: ","")
                    $result.Warnings += $_.replace("WARNING: ","")
                } elseif ($_ -match 'ERROR: \w*') {
                    Write-Error -Message $_.replace("ERROR: ","")
                    $result.Errors += $_.replace("ERROR: ","")
                } elseif ($_) {
                    if ($_ -notmatch ".*Command Line Interface started.*") {
                        $result.Result += $_
                    }
                }
            }
        } else {
            [MBS.Agent.CLIRawResult]$result = @{
                stdout = $Process.StandardOutput.ReadToEnd()
                stderr = $Process.StandardError.ReadToEnd()
                ExitCode = $Process.ExitCode
            }
        }
    }
    
    end {
        return $result
    }
}
# SIG # Begin signature block
