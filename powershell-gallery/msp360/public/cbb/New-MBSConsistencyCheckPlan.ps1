function New-MBSConsistencyCheckPlan {
    <#
    .SYNOPSIS
    Creates new consistency check plan.
    
    .DESCRIPTION
    Creates consistency check plan for specified storage. The minimum supported version of the MBS backup agent is 7.2.1.

    .PARAMETER StorageAccount
    Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER EncryptionPassword
    Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER Schedule
    Specify schedule. Use New-MBSPlanSchedule to create an object.
    
    .PARAMETER SkipLegacyBackupFormat
    Skip constistency check for legacy backup format

    .EXAMPLE
    New-MBSConsistencyCheckPlan -StorageAccount (Get-MBSStorageAccount | where {$_.DisplayName -eq "AWS S3"})

    Create consistency check plan for storage destination with name "AWS S3"

    .EXAMPLE
    New-MBSConsistencyCheckPlan -StorageAccount (Get-MBSStorageAccount | where {$_.DisplayName -eq "AWS S3"}) -EncryptionPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)

    Create consistency check plan for storage destination with name "AWS S3" that contains encrypted data

    .EXAMPLE
    New-MBSConsistencyCheckPlan -StorageAccount (Get-MBSStorageAccount | where {$_.DisplayName -eq "AWS S3"}) -SkipLegacyBackupFormat

    Create consistency check plan for storage destination with name "AWS S3" and skip constistency check for legacy backup format

    .INPUTS
    None.

    .OUTPUTS
    None.

    .NOTES
    Author: MSP360 Onboarding Team

    .LINK
    https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsconsistencycheckplan

    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")")]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        #
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $MasterPassword,
        #
        [Parameter(Mandatory=$False, HelpMessage="Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $EncryptionPassword,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule. Use New-MBSPlanSchedule to create an object.")]
        [MBS.Agent.Plan.Schedule]
        $Schedule,
        #
        [Parameter(Mandatory=$False, HelpMessage="Skip constistency check for legacy backup format")]
        [switch]
        $SkipLegacyBackupFormat
    )

    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
        if ([System.version](Get-MBSAgent).version -lt [System.version]"7.2.1.0") {
            Write-Error "Version $($CBB.version) is not supported. Please upgrade to the minimum supported version 7.2.1"
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
        function Set-Schedule {
            param (
                [Parameter()]
                [psobject]
                $Schedule
            )
            switch ($Schedule.Frequency) {
                Daily {$ScheduleCli += " -every day"}
                Weekly {$ScheduleCli += " -every week"}
                Monthly {$ScheduleCli += " -every month"}
                dayofmonth {$ScheduleCli += " -every dayofmonth"}
                Realtime {$ScheduleCli += " -every real-time"}
                Default {
                    #Write-Host "Schedule frequency is not specified."
                    #Break
                }
            }
            if ($Schedule.At){$ScheduleCli += " -at ""$($Schedule.At.ToString())"""}
            if ($Schedule.DayOfMonth){$ScheduleCli += " -day $($Schedule.DayOfMonth)"}
            if ($null -ne $Schedule.DayOfWeek){$ScheduleCli += " -weekday "+(($Schedule.DayOfWeek | foreach-object -Begin {$weekdaylocal = @()} -Process{$weekdaylocal += $_.ToString().Substring(0,2)} -End {return $weekdaylocal.ToLower()}) -join ",")}
            if ($Schedule.Weeknumber){$ScheduleCli += " -weeknumber $($Schedule.Weeknumber)"}
            if ($Schedule.OccursFrom){$ScheduleCli += " -dailyFrom $($Schedule.OccursFrom.ToString('hh\:mm'))"}
            if ($Schedule.OccursTo){$ScheduleCli += " -dailyTill $($Schedule.OccursTo.ToString('hh\:mm'))"}
            if ($Schedule.OccursEvery.TotalMinutes -ne 0){
                if ($Schedule.OccursEvery.TotalHours -gt 180){
                    $ScheduleCli += " -occurs hour -occurValue 180"
                }elseif($Schedule.OccursEvery.TotalHours -lt 180 -and $Schedule.OccursEvery.TotalHours -ge 1){
                    $ScheduleCli += " -occurs hour -occurValue $([Math]::Round($Schedule.OccursEvery.TotalHours))"
                }elseif($Schedule.OccursEvery.TotalHours -lt 1 -and $Schedule.OccursEvery.TotalMinutes -ge 1){
                    $ScheduleCli += " -occurs min -occurValue $([Math]::Round($Schedule.OccursEvery.TotalMinutes))"
                }else{
                    Write-host "Schedule 'OccursEvery' parameter cannot be less then 1 minute."
                }
            }
            if ($Schedule.RepeatInterval){$ScheduleCli += " -repeatEvery $($Schedule.RepeatInterval)"}
            if ($Schedule.RepeatStartDate){$ScheduleCli += " -repeatStartDate ""$($Schedule.RepeatStartDate.ToString())"""}   

            return $Schedulecli
        }

        function Set-Argument{
            $Argument += " -aid ""$($StorageAccount.ID)"""
            if($EncryptionPassword){$Argument += " -ep """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($EncryptionPassword)))+""""}
            if($Schedule){$Argument += Set-Schedule -Schedule $Schedule}
            if($SkipLegacyBackupFormat){$Argument += " -skiplegacy yes"}
            Return $Argument
        }

        $Arguments = " addConsistencyCheckPlan"
        $Arguments += Set-Argument

        (Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword).result
    }
    
    end {
        
    }
}

# SIG # Begin signature block
