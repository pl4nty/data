function Get-MBSBackupPlan {
    <#
    .SYNOPSIS
        Get backup plans from MBS backup agent.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType All -PlanFormat All -PlanType All
        Lists all backup plans
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType Local -PlanFormat All -PlanType All
        Lists only backup plans with a local destination.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType Cloud -PlanFormat All -PlanType All
        Lists only backup plans with a cloud destination.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType All -PlanFormat CBF -PlanType All
        Lists all CBF (Legacy) backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType All -PlanFormat NBF -PlanType All
        Lists all NBF backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType All -PlanFormat All -PlanType File-Level
        Lists all File-level backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType All -PlanFormat All -PlanType Image-Based
        Lists all Image-Based backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType Local -PlanFormat CBF -PlanType Image-Based
        Lists CBF (Legacy) Image-Based backup plans with a local destination.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType All -PlanFormat All -PlanType All -OutputType Full
        Get extended parameters of all backup plans.
    .INPUTS
        None
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/get-mbsbackupplan
    #>
    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="Backup destination storage type")]
        [ValidateSet("All", "Local", "Cloud", "Hybrid")]
        [string]
        $StorageType = "All",
        #
        [Parameter(Mandatory=$false, HelpMessage="Backup plan format")]
        [ValidateSet("All", "CBF", "Legacy", "NBF")]
        [string]
        $PlanFormat = "All",
        #
        [Parameter(Mandatory=$false, HelpMessage="Backup plan type")]
        [ValidateSet("All", "File-Level", "Image-Based", "MSSQL","MSExchange","VMware","Hyper-V")]
        [string]
        $PlanType = "All",
        #
        [Parameter(Mandatory=$false, HelpMessage="Output type")]
        [ValidateSet("Short", "Full", "Raw")]
        [string]
        $OutputType = "Short"
    )

    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
    }

    process {
    function Compare-StorageTypes {
        param (
            $Account,
            [string]$StorageType
        )

        $result = $false
        switch -exact ($StorageType) {
            "All" {$result = $true}
            "Cloud" { 
                if($Account.SGCloudTypeValue -ne "FileSystemConnection" -and $Account.SGCloudTypeValue -ne "PhysicalFile" -and $BackupPlanConvertedObject.HybridID -eq "00000000-0000-0000-0000-000000000000"){
                    $result = $true 
                }else {
                    $result = $false
                }
            }
            "Local" {
                if($Account.Type -eq "FileSystemConnection" -or $Account.SGCloudTypeValue -eq "PhysicalFile"){
                    $result = $true 
                }else {
                    $result = $false
                }
            }
            "Hybrid" {
                if ($BackupPlanConvertedObject.HybridID -ne "00000000-0000-0000-0000-000000000000") {
                    $result = $true 
                }else {
                    $result = $false
                }
            }
            Default {}
        }
        return $result
    }

    function Convert-Output {
        param (
            $InputArray
        )
        $OutputResult = $null
        switch ($OutputType) {
            "Short" {
                $OutputResult = $InputArray | Select-Object ID, Name, Type, Bucket, ConnectionID, UseEncryption, UseCompression, Items, ExcludedItems, DiskInfo, Schedule, ForceFullSchedule
            }
            "Full" {
                $OutputResult = $InputArray | Select-Object -Property * -ExcludeProperty xsd, xsi, Tag
            }
            "Raw" {
                $OutputResult = $InputArray | Select-Object *
            }
            Default {Write-Error -message "Incorrect OutputType parameter"}
        }
        return $OutputResult
    }

    function Convert-NBFFileLevelOutput {
        param (
            $BackupPlanNBFConverted
        )
        $NBFFileLevelOutputResult = New-Object -TypeName MBS.Agent.Plan.NBFFileLevelBackupPlan -Property @{
            Name = $BackupPlanNBFConverted.Name
            ID = $BackupPlanNBFConverted.ID
            StorageAccount = Get-MBSStorageAccount -ID $BackupPlanNBFConverted.ConnectionID
            BackupPlanCommonOption = New-Object -TypeName MBS.Agent.Plan.NBFBackupPlanCommonOption -Property @{
                SyncRepositoryBeforeRun = $BackupPlanNBFConverted.SyncBeforeRun
                UseServerSideEncryption = $BackupPlanNBFConverted.UseServerSideEncryption
                EncryptionAlgorithm = ($BackupPlanNBFConverted.EncryptionAlgorithm+$BackupPlanNBFConverted.EncryptionKeySize)
                EncryptionPassword = $(if($BackupPlanNBFConverted.UseEncryption){ConvertTo-SecureString -string "!<encrypted_string>!" -AsPlainText -Force}else{$null})
                UseCompression = $BackupPlanNBFConverted.UseCompression
                StorageClass = ([MBS.Agent.Plan.StorageClassCBB]$BackupPlanNBFConverted.StorageClass).value__
                FullConsistencyCheck = $BackupPlanNBFConverted.UseFullConsistencyCheck
                StopIfPlanRunsFor = $(if($BackupPlanNBFConverted.Schedule.StopAfterTicks -eq "9223372036854775807"){[timespan]"00:00:00"}else{[timespan]$BackupPlanNBFConverted.Schedule.StopAfterTicks})
                RunMissedPlanImmediately = $BackupPlanNBFConverted.ForceMissedSchedule
                PreActionCommand = $(if($BackupPlanNBFConverted.Actions.Pre.Enabled){$BackupPlanNBFConverted.Actions.Pre.CommandLine + " " + $BackupPlanNBFConverted.Actions.Pre.Arguments})
                PreActionContinueAnyway = $(if($BackupPlanNBFConverted.Actions.Pre.Enabled){-not $BackupPlanNBFConverted.Actions.Pre.TerminateOnFailure})
                PostActionCommand = $(if($BackupPlanNBFConverted.Actions.Post.Enabled){$BackupPlanNBFConverted.Actions.Post.CommandLine + " " + $BackupPlanNBFConverted.Actions.Post.Arguments})
                PostActionRunAnyway = $(if($BackupPlanNBFConverted.Actions.Post.Enabled){$BackupPlanNBFConverted.Actions.Post.RunOnBackupFailure})
                BackupChainPlanID = $(if($BackupPlanNBFConverted.ExecuteNextPlan){$BackupPlanNBFConverted.NextExectutionPlan})
                BackupChainExecuteOnlyAfterSuccess = $(if($BackupPlanNBFConverted.ExecuteNextPlan){$BackupPlanNBFConverted.ExecuteNextPlanOnlyIfSucces})
                BackupChainExecuteForceFull = $(if($BackupPlanNBFConverted.ExecuteNextPlan){$BackupPlanNBFConverted.ForceFullNextPlan})
                ResultEmailNotification = $(if($BackupPlanNBFConverted.Notification.SendNotification -and $BackupPlanNBFConverted.Notification.OnlyOnFailure){
                    [MBS.Agent.Plan.Notification]"errorOnly"
                }elseif ($BackupPlanNBFConverted.Notification.SendNotification -and -not $BackupPlanNBFConverted.Notification.OnlyOnFailure) {
                    [MBS.Agent.Plan.Notification]"on"
                }elseif (-not $BackupPlanNBFConverted.Notification.SendNotification) {
                    [MBS.Agent.Plan.Notification]"off"
                })
                AddEventToWindowsLog = $(if($BackupPlanNBFConverted.WindowsEventLogNotification.SendNotification -and $BackupPlanNBFConverted.WindowsEventLogNotification.OnlyOnFailure){
                    [MBS.Agent.Plan.Notification]"errorOnly"
                }elseif ($BackupPlanNBFConverted.WindowsEventLogNotification.SendNotification -and -not $BackupPlanNBFConverted.WindowsEventLogNotification.OnlyOnFailure) {
                    [MBS.Agent.Plan.Notification]"on"
                }elseif (-not $BackupPlanNBFConverted.WindowsEventLogNotification.SendNotification) {
                    [MBS.Agent.Plan.Notification]"off"
                })
                ForeverForwardIncremental = $BackupPlanNBFConverted.ForwardIncremental
                IntelligentRetention = $BackupPlanNBFConverted.AutomaticallyReduceEarlyDeletionFee
                KeepVersionPeriod = $(if($BackupPlanNBFConverted.SerializationSupportRetentionTime -eq "10675199.02:48:05.4775807") {
                    $null
                }else{
                    [int]([timespan]$BackupPlanNBFConverted.SerializationSupportRetentionTime).TotalDays
                })
                GFSKeepWeekly = $(if($BackupPlanNBFConverted.GFSPolicySettings.IsEnabled -and $BackupPlanNBFConverted.GFSPolicySettings.Weekly.IsEnabled){
                    $BackupPlanNBFConverted.GFSPolicySettings.Weekly.StorePeriod
                }else {
                    $null
                })
                GFSKeepMonthly = $(if($BackupPlanNBFConverted.GFSPolicySettings.IsEnabled -and $BackupPlanNBFConverted.GFSPolicySettings.Monthly.IsEnabled){
                    $BackupPlanNBFConverted.GFSPolicySettings.Monthly.StorePeriod
                }else {
                    $null
                })
                GFSKeepYearly = $(if($BackupPlanNBFConverted.GFSPolicySettings.IsEnabled -and $BackupPlanNBFConverted.GFSPolicySettings.Yearly.IsEnabled){
                    $BackupPlanNBFConverted.GFSPolicySettings.Yearly.StorePeriod
                }else {
                    $null
                })
                GFSMonthOfTheYear = $(if($BackupPlanNBFConverted.GFSPolicySettings.IsEnabled -and $BackupPlanNBFConverted.GFSPolicySettings.Yearly.IsEnabled){
                    $BackupPlanNBFConverted.GFSPolicySettings.Yearly.TakeBackupFromMonth
                }else {
                    0
                })
            }
            Schedule = $(if($BackupPlanNBFConverted.Schedule.Enabled){
                New-Object -TypeName MBS.Agent.Plan.NBFIncrementalSchedule -Property @{
                    Frequency = $(if (($BackupPlanNBFConverted.Schedule.RecurType -eq "Weekly") -And (-not (Compare-Object -ReferenceObject $BackupPlanNBFConverted.Schedule.WeekDays.DayOfWeek -DifferenceObject @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))) {
                        "Daily"
                    }else {
                        $BackupPlanNBFConverted.Schedule.RecurType
                    })
                    At = $(if (-not $BackupPlanNBFConverted.Schedule.DailyRecurrence) {
                        [datetime]"$($BackupPlanNBFConverted.Schedule.Hour):$($BackupPlanNBFConverted.Schedule.Minutes)"
                    }else{
                        [datetime]"1/1/0001 0:00:00"
                    })
                    DayOfMonth = $(if ($BackupPlanNBFConverted.Schedule.RecurType -eq "DayOfMonth") {
                        $BackupPlanNBFConverted.Schedule.DayOfMonth
                    }else{
                        $null
                    })
                    DayOfWeek = $(if (($BackupPlanNBFConverted.Schedule.RecurType -eq "Weekly") -And (Compare-Object -ReferenceObject $BackupPlanNBFConverted.Schedule.WeekDays.DayOfWeek -DifferenceObject @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"))) {
                        $BackupPlanNBFConverted.Schedule.WeekDays.DayOfWeek
                    }elseif($BackupPlanNBFConverted.Schedule.RecurType -eq "Monthly") {
                        $BackupPlanNBFConverted.Schedule.DayOfWeek
                    }else{
                        $null
                    })
                    WeekNumber = $(if ($BackupPlanNBFConverted.Schedule.RecurType -eq "Monthly") {
                        $BackupPlanNBFConverted.Schedule.WeekNumber
                    }else {
                        $null
                    })
                    OccursFrom =  $(if ($BackupPlanNBFConverted.Schedule.DailyRecurrence) {
                        [timespan]"$($BackupPlanNBFConverted.Schedule.DailyFromHour):$($BackupPlanNBFConverted.Schedule.DailyFromMinutes)"
                    }else{
                        [timespan]"00:00:00"
                    })
                    OccursTo =  $(if ($BackupPlanNBFConverted.Schedule.DailyRecurrence) {
                        [timespan]"$($BackupPlanNBFConverted.Schedule.DailyTillHour):$($BackupPlanNBFConverted.Schedule.DailyTillMinutes)"
                    }else{
                        [timespan]"00:00:00"
                    })
                    OccursEvery =  $(if ($BackupPlanNBFConverted.Schedule.DailyRecurrence) {
                        New-TimeSpan -Minutes $BackupPlanNBFConverted.Schedule.DailyRecurrencePeriod
                    }else{
                        [timespan]"00:00:00"
                    })
                    RepeatInterval = $BackupPlanNBFConverted.Schedule.RepeatEvery
                    RepeatStartDate = $BackupPlanNBFConverted.Schedule.OnceDate
                }
            }else {
                $null
            })
            ForceFullSchedule = $(if($BackupPlanNBFConverted.ForceFullSchedule.Enabled){
                New-Object -TypeName MBS.Agent.Plan.NBFFullSchedule -Property @{
                    Frequency = $(if (($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "Weekly") -And (-not (Compare-Object -ReferenceObject $BackupPlanNBFConverted.ForceFullSchedule.WeekDays.DayOfWeek -DifferenceObject @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))) {
                        "Daily"
                    }else {
                        $BackupPlanNBFConverted.ForceFullSchedule.RecurType
                    })
                    DayOfMonth = $(if ($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "DayOfMonth") {
                        $BackupPlanNBFConverted.ForceFullSchedule.DayOfMonth
                    }else{
                        $null
                    })
                    DayOfWeek = $(if (($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "Weekly") -And (Compare-Object -ReferenceObject $BackupPlanNBFConverted.ForceFullSchedule.WeekDays.DayOfWeek -DifferenceObject @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"))) {
                        $BackupPlanNBFConverted.ForceFullSchedule.WeekDays.DayOfWeek
                    }elseif($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "Monthly") {
                        $BackupPlanNBFConverted.ForceFullSchedule.DayOfWeek
                    }else{
                        $null
                    })
                    WeekNumber = $(if ($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "Monthly") {
                        $BackupPlanNBFConverted.ForceFullSchedule.WeekNumber
                    }else {
                        $null
                    })
                    RepeatInterval = $BackupPlanNBFConverted.ForceFullSchedule.RepeatEvery
                    RepeatStartDate = $BackupPlanNBFConverted.ForceFullSchedule.OnceDate
                }
            }else {
                $null
            })
            BackupNTFSPermissions = $BackupPlanNBFConverted.BackupNTFSPermissions
            FastNTFSScan = $BackupPlanNBFConverted.UseFastNtfsScan
            ForceUsingVSS = $BackupPlanNBFConverted.AlwaysUseVSS
            KeepEFSEncryption = $BackupPlanNBFConverted.BackupEfsFilesAsIs
            UseShareReadWriteModeOnError = $BackupPlanNBFConverted.UseShareReadWriteModeOnError
            BackupEmptyFolders = $BackupPlanNBFConverted.BackupEmptyFolders
            BackupOnlyAfter = [datetime]$BackupPlanNBFConverted.BackupOnlyAfterUTC
            ExcludeSystemHiddenFiles = -not $BackupPlanNBFConverted.BackupFilter.IncludeSystemAndHidden
            SkipFolder = $BackupPlanNBFConverted.ExcludeFodlerList.string
            IncludeFilesMask = $(if ($BackupPlanNBFConverted.BackupFilter.FilterType -eq "UseIncludeMask") {
                $BackupPlanNBFConverted.BackupFilter.Filters.string
            }else {
                $null
            })
            ExcludeFilesMask = $(if ($BackupPlanNBFConverted.BackupFilter.FilterType -eq "UseExcludeMask") {
                $BackupPlanNBFConverted.BackupFilter.Filters.string
            }else {
                $null
            })
            IgnoreErrorPathNotFound = $BackupPlanNBFConverted.UseIgnoreErrorsOnPathNotFound
            BackupItem = $BackupPlanNBFConverted.Items.PlanItem.Path 
            ExcludeItem = $BackupPlanNBFConverted.ExcludedItems.PlanItem.Path 
            
            #| ForEach-Object -Begin {$BackupFileArray = @()} -Process {
            #    if(([IO.FileInfo]$_).Extension -ne ""){
            #        $BackupFileArray += $_
            #    }
            #} -End {if($BackupFileArray){$BackupFileArray}else{$null}})
            #BackupDirectory = $($BackupPlanNBFConverted.Items.PlanItem.Path | ForEach-Object -Begin {$BackupDirectoryArray = @()} -Process {
            #    if(([IO.FileInfo]$_).Extension -eq ""){
            #        $BackupDirectoryArray += $_
            #    }
            #} -End {if($BackupDirectoryArray){$BackupDirectoryArray}else{$null}})
            
            GenerateDetailedReport = $BackupPlanNBFConverted.Notification.GenerateReport
        }
        return $NBFFileLevelOutputResult
    }

    function Convert-NBFImageBasedOutput {
        param (
            $BackupPlanNBFConverted
        )
        $NBFImageBasedOutputResult = New-Object -TypeName MBS.Agent.Plan.NBFImageBasedBackupPlanCBB -Property @{
            Name = $BackupPlanNBFConverted.Name
            ID = $BackupPlanNBFConverted.ID
            StorageAccount = Get-MBSStorageAccount -ID $BackupPlanNBFConverted.ConnectionID
            BackupPlanCommonOption = New-Object -TypeName MBS.Agent.Plan.NBFBackupPlanCommonOption -Property @{
                SyncRepositoryBeforeRun = $BackupPlanNBFConverted.SyncBeforeRun
                UseServerSideEncryption = $BackupPlanNBFConverted.UseServerSideEncryption
                EncryptionAlgorithm = ($BackupPlanNBFConverted.EncryptionAlgorithm+$BackupPlanNBFConverted.EncryptionKeySize)
                EncryptionPassword = $(if($BackupPlanNBFConverted.UseEncryption){ConvertTo-SecureString -string "!<encrypted_string>!" -AsPlainText -Force}else{$null})
                UseCompression = $BackupPlanNBFConverted.UseCompression
                StorageClass = ([MBS.Agent.Plan.StorageClassCBB]$BackupPlanNBFConverted.StorageClass).value__
                FullConsistencyCheck = $BackupPlanNBFConverted.UseFullConsistencyCheck
                StopIfPlanRunsFor = $(if($BackupPlanNBFConverted.Schedule.StopAfterTicks -eq "9223372036854775807"){[timespan]"00:00:00"}else{[timespan]$BackupPlanNBFConverted.Schedule.StopAfterTicks})
                RunMissedPlanImmediately = $BackupPlanNBFConverted.ForceMissedSchedule
                PreActionCommand = $(if($BackupPlanNBFConverted.Actions.Pre.Enabled){$BackupPlanNBFConverted.Actions.Pre.CommandLine + " " + $BackupPlanNBFConverted.Actions.Pre.Arguments})
                PreActionContinueAnyway = $(if($BackupPlanNBFConverted.Actions.Pre.Enabled){-not $BackupPlanNBFConverted.Actions.Pre.TerminateOnFailure})
                PostActionCommand = $(if($BackupPlanNBFConverted.Actions.Post.Enabled){$BackupPlanNBFConverted.Actions.Post.CommandLine + " " + $BackupPlanNBFConverted.Actions.Post.Arguments})
                PostActionRunAnyway = $(if($BackupPlanNBFConverted.Actions.Post.Enabled){$BackupPlanNBFConverted.Actions.Post.RunOnBackupFailure})
                BackupChainPlanID = $(if($BackupPlanNBFConverted.ExecuteNextPlan){$BackupPlanNBFConverted.NextExectutionPlan})
                BackupChainExecuteOnlyAfterSuccess = $(if($BackupPlanNBFConverted.ExecuteNextPlan){$BackupPlanNBFConverted.ExecuteNextPlanOnlyIfSucces})
                BackupChainExecuteForceFull = $(if($BackupPlanNBFConverted.ExecuteNextPlan){$BackupPlanNBFConverted.ForceFullNextPlan})
                ResultEmailNotification = $(if($BackupPlanNBFConverted.Notification.SendNotification -and $BackupPlanNBFConverted.Notification.OnlyOnFailure){
                    [MBS.Agent.Plan.Notification]"errorOnly"
                }elseif ($BackupPlanNBFConverted.Notification.SendNotification -and -not $BackupPlanNBFConverted.Notification.OnlyOnFailure) {
                    [MBS.Agent.Plan.Notification]"on"
                }elseif (-not $BackupPlanNBFConverted.Notification.SendNotification) {
                    [MBS.Agent.Plan.Notification]"off"
                })
                AddEventToWindowsLog = $(if($BackupPlanNBFConverted.WindowsEventLogNotification.SendNotification -and $BackupPlanNBFConverted.WindowsEventLogNotification.OnlyOnFailure){
                    [MBS.Agent.Plan.Notification]"errorOnly"
                }elseif ($BackupPlanNBFConverted.WindowsEventLogNotification.SendNotification -and -not $BackupPlanNBFConverted.WindowsEventLogNotification.OnlyOnFailure) {
                    [MBS.Agent.Plan.Notification]"on"
                }elseif (-not $BackupPlanNBFConverted.WindowsEventLogNotification.SendNotification) {
                    [MBS.Agent.Plan.Notification]"off"
                })
                ForeverForwardIncremental = $BackupPlanNBFConverted.ForwardIncremental
                IntelligentRetention = $BackupPlanNBFConverted.AutomaticallyReduceEarlyDeletionFee
                KeepVersionPeriod = $(if($BackupPlanNBFConverted.SerializationSupportRetentionTime -eq "10675199.02:48:05.4775807") {
                    $null
                }else{
                    [int]([timespan]$BackupPlanNBFConverted.SerializationSupportRetentionTime).TotalDays
                })
                GFSKeepWeekly = $(if($BackupPlanNBFConverted.GFSPolicySettings.IsEnabled -and $BackupPlanNBFConverted.GFSPolicySettings.Weekly.IsEnabled){
                    $BackupPlanNBFConverted.GFSPolicySettings.Weekly.StorePeriod
                }else {
                    $null
                })
                GFSKeepMonthly = $(if($BackupPlanNBFConverted.GFSPolicySettings.IsEnabled -and $BackupPlanNBFConverted.GFSPolicySettings.Monthly.IsEnabled){
                    $BackupPlanNBFConverted.GFSPolicySettings.Monthly.StorePeriod
                }else {
                    $null
                })
                GFSKeepYearly = $(if($BackupPlanNBFConverted.GFSPolicySettings.IsEnabled -and $BackupPlanNBFConverted.GFSPolicySettings.Yearly.IsEnabled){
                    $BackupPlanNBFConverted.GFSPolicySettings.Yearly.StorePeriod
                }else {
                    $null
                })
                GFSMonthOfTheYear = $(if($BackupPlanNBFConverted.GFSPolicySettings.IsEnabled -and $BackupPlanNBFConverted.GFSPolicySettings.Yearly.IsEnabled){
                    $BackupPlanNBFConverted.GFSPolicySettings.Yearly.TakeBackupFromMonth
                }else {
                    0
                })
            }
            Schedule = $(if($BackupPlanNBFConverted.Schedule.Enabled){
                New-Object -TypeName MBS.Agent.Plan.NBFIncrementalSchedule -Property @{
                    Frequency = $(if (($BackupPlanNBFConverted.Schedule.RecurType -eq "Weekly") -And (-not (Compare-Object -ReferenceObject $BackupPlanNBFConverted.Schedule.WeekDays.DayOfWeek -DifferenceObject @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))) {
                        "Daily"
                    }else {
                        $BackupPlanNBFConverted.Schedule.RecurType
                    })
                    At = $(if (-not $BackupPlanNBFConverted.Schedule.DailyRecurrence) {
                        [datetime]"$($BackupPlanNBFConverted.Schedule.Hour):$($BackupPlanNBFConverted.Schedule.Minutes)"
                    }else{
                        [datetime]"1/1/0001 0:00:00"
                    })
                    DayOfMonth = $(if ($BackupPlanNBFConverted.Schedule.RecurType -eq "DayOfMonth") {
                        $BackupPlanNBFConverted.Schedule.DayOfMonth
                    }else{
                        $null
                    })
                    DayOfWeek = $(if (($BackupPlanNBFConverted.Schedule.RecurType -eq "Weekly") -And (Compare-Object -ReferenceObject $BackupPlanNBFConverted.Schedule.WeekDays.DayOfWeek -DifferenceObject @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"))) {
                        $BackupPlanNBFConverted.Schedule.WeekDays.DayOfWeek
                    }elseif($BackupPlanNBFConverted.Schedule.RecurType -eq "Monthly") {
                        $BackupPlanNBFConverted.Schedule.DayOfWeek
                    }else {
                        $null
                    })
                    WeekNumber = $(if ($BackupPlanNBFConverted.Schedule.RecurType -eq "Monthly") {
                        $BackupPlanNBFConverted.Schedule.WeekNumber
                    }else {
                        $null
                    })
                    OccursFrom =  $(if ($BackupPlanNBFConverted.Schedule.DailyRecurrence) {
                        [timespan]"$($BackupPlanNBFConverted.Schedule.DailyFromHour):$($BackupPlanNBFConverted.Schedule.DailyFromMinutes)"
                    }else{
                        [timespan]"00:00:00"
                    })
                    OccursTo =  $(if ($BackupPlanNBFConverted.Schedule.DailyRecurrence) {
                        [timespan]"$($BackupPlanNBFConverted.Schedule.DailyTillHour):$($BackupPlanNBFConverted.Schedule.DailyTillMinutes)"
                    }else{
                        [timespan]"00:00:00"
                    })
                    OccursEvery =  $(if ($BackupPlanNBFConverted.Schedule.DailyRecurrence) {
                        New-TimeSpan -Minutes $BackupPlanNBFConverted.Schedule.DailyRecurrencePeriod
                    }else{
                        [timespan]"00:00:00"
                    })
                    RepeatInterval = $BackupPlanNBFConverted.Schedule.RepeatEvery
                    RepeatStartDate = $BackupPlanNBFConverted.Schedule.OnceDate
                }
            }else {
                $null
            })
            ForceFullSchedule = $(if($BackupPlanNBFConverted.ForceFullSchedule.Enabled){
                New-Object -TypeName MBS.Agent.Plan.NBFFullSchedule -Property @{
                    Frequency = $(if (($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "Weekly") -And (-not (Compare-Object -ReferenceObject $BackupPlanNBFConverted.ForceFullSchedule.WeekDays.DayOfWeek -DifferenceObject @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")))) {
                        "Daily"
                    }else {
                        $BackupPlanNBFConverted.ForceFullSchedule.RecurType
                    })
                    DayOfMonth = $(if ($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "DayOfMonth") {
                        $BackupPlanNBFConverted.ForceFullSchedule.DayOfMonth
                    }else{
                        $null
                    })
                    DayOfWeek = $(if (($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "Weekly") -And (Compare-Object -ReferenceObject $BackupPlanNBFConverted.ForceFullSchedule.WeekDays.DayOfWeek -DifferenceObject @("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"))) {
                        $BackupPlanNBFConverted.ForceFullSchedule.WeekDays.DayOfWeek
                    }elseif($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "Monthly") {
                        $BackupPlanNBFConverted.ForceFullSchedule.DayOfWeek
                    }else{
                        $null
                    })
                    WeekNumber = $(if ($BackupPlanNBFConverted.ForceFullSchedule.RecurType -eq "Monthly") {
                        $BackupPlanNBFConverted.ForceFullSchedule.WeekNumber
                    }else {
                        $null
                    })
                    RepeatInterval = $BackupPlanNBFConverted.ForceFullSchedule.RepeatEvery
                    RepeatStartDate = $BackupPlanNBFConverted.ForceFullSchedule.OnceDate
                }
            }else {
                $null
            })
            BackupVolumes = $(switch ($BackupPlanNBFConverted.BackupVolumes) {
                "AllDrives" {[MBS.Agent.Plan.BackupVolumeType]"AllVolumes"}
                "FixedOnly" {[MBS.Agent.Plan.BackupVolumeType]"FixedVolumes"}
                "SystemRequired" { [MBS.Agent.Plan.BackupVolumeType]"SystemRequired" }
                "SelectedOnly" { [MBS.Agent.Plan.BackupVolumeType]"SelectedVolumes" }
                Default {  }
            })
            Volumes = $(if ($BackupPlanNBFConverted.BackupVolumes -eq "SelectedOnly") {
                $BackupPlanNBFConverted.DiskInfo.DiskInfoCommunication.Volumes.VolumeInfoCommunication | Where-Object Enabled -eq $true | ForEach-Object -Begin {$BackupVolumeArray = [System.Collections.Generic.List[MBS.Agent.IBBVolumeCBB]]::new()} -Process{
                    $BackupVolumeArray += New-Object -TypeName MBS.Agent.IBBVolumeCBB -Property @{
                        MountPoints = $_.MountPoints.string
                        Supported = $_.Supported
                        RequiredBySystem = $_.RequiredBySystem
                        DriveType = $_.DriveType
                        FileSystemType = $_.FileSystemType
                        WindowsVolumeIdentity = $_.WindowsVolumeIdentity
                        Length = $_.Length
                        UsedSpace = $_.UsedSpace
                        Label = $_.Label
                        IsBoot = $_.IsBoot
                        IsActive = $_.BiosIsActive
                        IsBitLocker = $_.IsBitLocker
                        BackupOptions = New-Object -TypeName MBS.Agent.IBBVolumeBackupOptionsCBB -Property @{
                            UseVss = $_.BackupOptions.UseVss
                            ExcludeRules = $(if ($null -ne $_.BackupOptions.ExcludeRules.FileExcludeRule) {
                                $_.BackupOptions.ExcludeRules.FileExcludeRule | ForEach-Object -Begin {$ExcludeRulesArray = [System.Collections.Generic.List[MBS.Agent.IBBVolumeBackupOptionsExcludeRulesCBB]]::new()} -Process{
                                    $ExcludeRulesArray += New-Object -TypeName MBS.Agent.IBBVolumeBackupOptionsExcludeRulesCBB -Property @{
                                        Folder = $_.Folder
                                        Mask = $_.Mask
                                        Recursive = $_.Recursive
                                        DeleteFolder = $_.DeleteFolder
                                    }
                                } -End {if($ExcludeRulesArray){$ExcludeRulesArray}else{}}
                            }else {
                                $null
                            })
                            KeepBitLocker = $_.BackupOptions.KeepBitLocker
                        }
                    }
                } -End {if($BackupVolumeArray){$BackupVolumeArray}else{}}
            }else {
                $null
            })
            DisableVSS = $BackupPlanNBFConverted.DisableVSS
            IgnoreBadSectors = $BackupPlanNBFConverted.IgnoreBadSectors
            UseSystemVSS = $(if ($BackupPlanNBFConverted.VSSProviderID -eq "b5946137-7b9f-4925-af80-51abd60b20d5") {
                $true
            }else {
                $false
            })
            PrefetchBlockCount = $BackupPlanNBFConverted.PrefetchBlockCount
            BlockSize = $BackupPlanNBFConverted.BlockSize / 1024
            RestoreVerificationMode = $(switch ($BackupPlanNBFConverted.RunRestoreVerificationOn) {
                "None" { [MBS.Agent.Plan.RestoreVerificationMode]"DoNotRun" }
                "OnFull" { [MBS.Agent.Plan.RestoreVerificationMode]"RunForFull" }
                "OnDiff" { [MBS.Agent.Plan.RestoreVerificationMode]"RunForIncremental" }
                "OnAll" { [MBS.Agent.Plan.RestoreVerificationMode]"RunForFullAndIncremental" }
                Default {}
            })
        }
        return $NBFImageBasedOutputResult
    }

        #Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): Arguments: -StorageType $StorageType -PlanFormat $PlanFormat -PlanType $PlanType"
        $BackupPlansCBFArray = @()
        $BackupPlansNBFArray = @()
        $BackupPlansNBFClassArray = @()
        $BackupPlansReturnArray = @()
        foreach ($_ in (Get-ChildItem ("$($CBB.CBBProgramData)\*.cbb")  -ErrorAction SilentlyContinue)){ 
            if (Get-Content $_.FullName){
                $BackupPlan = [xml](Get-Content ($_.FullName))
                $BackupPlanConvertedObject = Convert-XMLtoPSObject $BackupPlan.BasePlan
                switch ($PlanType) {
                    "All" 
                    { 
                        if ($BackupPlanConvertedObject.type -notlike "*Restore*" -and $BackupPlanConvertedObject.type -ne "ConsistencyCheckPlan"){
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $BackupPlanConvertedObject.ConnectionID) -StorageType $StorageType){
                                if ($BackupPlanConvertedObject.IsArchive -eq "true"){
                                    if ($OutputType -ne "Raw") {
                                        if ($BackupPlanConvertedObject.type -eq "Plan"){
                                            $BackupPlansNBFClassArray += Convert-NBFFileLevelOutput $BackupPlanConvertedObject
                                        } elseif ($BackupPlanConvertedObject.type -eq "BackupDiskImagePlan") {
                                            $BackupPlansNBFClassArray += Convert-NBFImageBasedOutput $BackupPlanConvertedObject
                                        } else {
                                            $BackupPlansNBFArray += $BackupPlanConvertedObject
                                        }
                                    } else {
                                        $BackupPlansNBFArray += $BackupPlanConvertedObject
                                    }
                                } else {
                                    $BackupPlansCBFArray += $BackupPlanConvertedObject
                                }
                            }
                        }
                    }
                    "File-Level" 
                    { 
                        if ($BackupPlanConvertedObject.type -eq "Plan"){
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $BackupPlanConvertedObject.ConnectionID) -StorageType $StorageType){
                                if ($BackupPlanConvertedObject.IsArchive -eq "true") {
                                    if ($OutputType -ne "Raw") {
                                        $BackupPlansNBFClassArray += Convert-NBFFileLevelOutput $BackupPlanConvertedObject
                                    } else {
                                        $BackupPlansNBFArray += $BackupPlanConvertedObject
                                    }
                                }else{
                                    $BackupPlansCBFArray += $BackupPlanConvertedObject
                                }
                            }
                        }
                    }
                    "Image-Based" 
                    {
                        if ($BackupPlanConvertedObject.type -eq "BackupDiskImagePlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $BackupPlanConvertedObject.ConnectionID) -StorageType $StorageType){
                                if ($BackupPlanConvertedObject.IsArchive -eq "true") {
                                    if ($OutputType -ne "Raw") {
                                        $BackupPlansNBFClassArray += Convert-NBFImageBasedOutput $BackupPlanConvertedObject
                                    } else {
                                        $BackupPlansNBFArray += $BackupPlanConvertedObject
                                    }
                                }else{
                                    $BackupPlansCBFArray += $BackupPlanConvertedObject
                                }
                            }
                        }
                    }
                    "MSSQL" 
                    {
                        if ($BackupPlanConvertedObject.type -eq "BackupDatabasePlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $BackupPlanConvertedObject.ConnectionID) -StorageType $StorageType){
                                if ($BackupPlanConvertedObject.IsArchive -eq "true") {
                                    $BackupPlansNBFArray += $BackupPlanConvertedObject
                                } else {
                                    $BackupPlansCBFArray += $BackupPlanConvertedObject
                                }
                            }
                        }
                    }
                    "MSExchange" 
                    {
                        if ($BackupPlanConvertedObject.type -eq "BackupExchangePlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $BackupPlanConvertedObject.ConnectionID) -StorageType $StorageType){
                                if ($BackupPlanConvertedObject.IsArchive -eq "true") {
                                    $BackupPlansNBFArray += $BackupPlanConvertedObject
                                } else {
                                    $BackupPlansCBFArray += $BackupPlanConvertedObject
                                }
                            }
                        }
                    }
                    "VMware" 
                    {
                        if ($BackupPlanConvertedObject.type -eq "BackupVirtualMachinesESXiPlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $BackupPlanConvertedObject.ConnectionID) -StorageType $StorageType){
                                if ($BackupPlanConvertedObject.IsArchive -eq "true") {
                                    $BackupPlansNBFArray += $BackupPlanConvertedObject
                                } else {
                                    $BackupPlansCBFArray += $BackupPlanConvertedObject
                                }
                            }
                        }
                    }
                    "Hyper-V" 
                    {
                        if ($BackupPlanConvertedObject.type -eq "BackupVirtualMachinesHyperVPlan") {
                            if(Compare-StorageTypes -Account (Get-MBSStorageAccount -ID $BackupPlanConvertedObject.ConnectionID) -StorageType $StorageType){
                                if ($BackupPlanConvertedObject.IsArchive -eq "true") {
                                    $BackupPlansNBFArray += $BackupPlanConvertedObject
                                } else {
                                    $BackupPlansCBFArray += $BackupPlanConvertedObject
                                }
                            }
                        }
                    }
                    Default {Write-Error -message "Incorrect PlanType parameter"}
                }
            }
        }
        if ($PlanFormat -eq "Legacy") {$PlanFormat = "CBF"}
        switch ($PlanFormat) {
            "All" {
                $BackupPlansReturnArray += $BackupPlansNBFClassArray
                $BackupPlansReturnArray += Convert-Output -InputArray $BackupPlansNBFArray
                $BackupPlansReturnArray += Convert-Output -InputArray $BackupPlansCBFArray
            }
            "CBF" {
                $BackupPlansReturnArray += Convert-Output -InputArray $BackupPlansCBFArray
            }
            "NBF" {
                $BackupPlansReturnArray += $BackupPlansNBFClassArray
                $BackupPlansReturnArray += Convert-Output -InputArray $BackupPlansNBFArray
            }
            Default {Write-Error -message "Incorrect PlanFormat parameter"}
        }
        
        return $BackupPlansReturnArray
    }

    end{

    }
}

# SIG # Begin signature block
