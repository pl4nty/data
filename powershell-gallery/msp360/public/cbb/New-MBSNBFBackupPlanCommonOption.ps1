function New-MBSNBFBackupPlanCommonOption {
    <#
    .SYNOPSIS
    Returns MBS.Agent.Plan.NBFBackupPlanCommonOption type object with common backup plan options.
    
    .DESCRIPTION
    Create NBFBackupPlanCommonOption type object with common backup plan options. Used with New-MBSNBFFileBackupPlan and  New-MBSNBFIBBBackupPlan cmdlets.
    
    .PARAMETER SyncRepositoryBeforeRun
    Synchronize local repository before running backup plan
    
    .PARAMETER UseServerSideEncryption
    Use server side encryption (valid only for Amazon S3)
    
    .PARAMETER EncryptionAlgorithm
    Encryption algorithm. Possible values: AES128-256
    
    .PARAMETER EncryptionPassword
    Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string Your_Password" -AsPlainText -Force)
    
    .PARAMETER UseCompression
    Use compression for backup
    
    .PARAMETER StorageClass
    Storage Class (valid only for Amazon S3)

    .PARAMETER FullConsistencyCheck
    Use full consistency check
    
    .PARAMETER StopIfPlanRunsFor
    Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -StopIfPlanRunsFor "20:30" or -StopIfPlanRunsFor "100:00 etc.
    
    .PARAMETER RunMissedPlanImmediately
    Run missed scheduled backup immediately when computer starts up.
    
    .PARAMETER ForeverForwardIncremental
    Enables Forever Forward Incremental backup

    .PARAMETER PreActionCommand
    Specify command to be executed before backup completes
    
    .PARAMETER PreActionContinueAnyway
    Specify to continue backup plan if pre-backup action failed.
    
    .PARAMETER PostActionCommand
    Specify command to be executed after backup has been successfully completed.
    
    .PARAMETER PostActionRunAnyway
    Specify to execute post-backup action in any case (regardless the backup result).

    .PARAMETER BackupChainPlanID
    Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plan name').ID

    .PARAMETER BackupChainExecuteOnlyAfterSuccess
    Specify to execute the chained plan only if the current plan is completed successfully ($true) or always ($false)

    .PARAMETER BackupChainExecuteForceFull
    Specify to force full backup for the chained plan

    .PARAMETER ResultEmailNotification
    Specify to send backup plan result notification email when backup fails (errorOnly) or in all cases (on). Prior to turn on the notification settings must be configured.
    
    .PARAMETER AddEventToWindowsLog
    Specify to add entry to Windows Event Log when backup fails (errorOnly) or in all cases (on).
    
    .PARAMETER KeepVersionPeriod
    Keep versions for specified number of days. Omit to use defult retention policy, set 0 to keep all versions or specify number of days. Example: -KeepVersionPeriod 180
    
    .PARAMETER GFSKeepWeekly
    Enables GFS weekly storage type. Example: -KeepVersionPeriod 4
    
    .PARAMETER GFSKeepMonthly
    Enables GFS monthly storage type. Example: -KeepVersionPeriod 12
    
    .PARAMETER GFSKeepYearly
    Enables GFS yearly storage type. Example: -KeepVersionPeriod 5
    
    .PARAMETER GFSMonthOfTheYear
    Specify the number of month for the first successful GFS full backup for yearly storage type. Example: -GFSMonthOfTheYear February

    .PARAMETER IntelligentRetention
    Enables Intelligent Retention for Forever Forward Incremental

    .EXAMPLE
    $CommonOptions = New-MBSNBFBackupPlanCommonOption -SyncRepositoryBeforeRun $true -UseServerSideEncryption $true -EncryptionAlgorithm AES256 -EncryptionPassword (ConvertTo-SecureString -string "My_Password" -AsPlainText -Force) -UseCompression $true -StorageClass OneZoneIA -StopIfPlanRunsFor 10:00
    
    Create backup plan common options object.

    .INPUTS
        None.

    .OUTPUTS
        MBS.Agent.Plan.NBFBackupPlanCommonOption

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsnbfbackupplancommonoption
    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$False, HelpMessage="Sync before run.")]
        [boolean]
        $SyncRepositoryBeforeRun=$False,
        #
        [Parameter(Mandatory=$False, HelpMessage="Use server side encryption (valid only for Amazon S3)")]
        [boolean]
        $UseServerSideEncryption=$False,
        #
        [Parameter(Mandatory=$False, HelpMessage="Encryption algorithm. Possible values: AES128-256")]
        [MBS.Agent.Plan.EncryptionAlgorithm]
        $EncryptionAlgorithm='AES256',
        #
        [Parameter(Mandatory=$False, HelpMessage="Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)")]
        [SecureString]
        $EncryptionPassword,
        #
        [Parameter(Mandatory=$False, HelpMessage="Use compression for backup")]
        [boolean]
        $UseCompression=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Storage Class (valid only for Amazon S3)")]
        [MBS.Agent.Plan.StorageClass]
        $StorageClass='Standard',
        #
        [Parameter(Mandatory=$False, HelpMessage="Use full consistency check.")]
        [boolean]
        $FullConsistencyCheck=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -StopIfPlanRunsFor ""20:30"" or -StopIfPlanRunsFor ""100:00"" etc.")]
        [ValidatePattern("^([01]?[0-9]|2[0-3]):[0-5][0-9]:[0][0]$")]
        [timespan]
        $StopIfPlanRunsFor='00:00',
        #
        [Parameter(Mandatory=$False, HelpMessage='Run missed scheduled backup immediately when computer starts up. Possible values: $true/$false')]
        [boolean]
        $RunMissedPlanImmediately=$False,
        #
        [Parameter(Mandatory=$True, HelpMessage='Enables Forever Forward Incremental backup. Possible values: $true/$false', ParameterSetName='FFI')]
        [boolean]
        $ForeverForwardIncremental=$False,
        # ------------------ Pre / Post actions ----------------------------
        [Parameter(Mandatory=$False, HelpMessage="Specify command to be executed before backup completes.")]
        [string]
        $PreActionCommand,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to continue backup plan if pre-backup action failed. Possible values: $true/$false')]
        [Alias("pac")]
        [Nullable[boolean]]
        $PreActionContinueAnyway,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify command to be executed after backup has been successfully completed.")]
        [string]
        $PostActionCommand,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to execute post-backup action in any case (regardless the backup result). Possible values: $true/$false')]
        [Alias("paa")]
        [Nullable[boolean]]
        $PostActionRunAnyway,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plan name').ID")]
        [string]
        $BackupChainPlanID,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to execute the chained plan only if the current plan is completed successfully ($true) or always ($false)')]
        [Nullable[boolean]]
        $BackupChainExecuteOnlyAfterSuccess,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to force full backup for the chained plan. Possible values: $true/$false')]
        [Nullable[boolean]]
        $BackupChainExecuteForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify to send backup plan result notification email when backup fails (errorOnly) or in all cases (on). Prior to turn on the notification settings must be configured. Possible values: errorOnly, on, off")]
        [MBS.Agent.Plan.Notification]
        $ResultEmailNotification = 'off',
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify to add entry to Windows Event Log when backup fails (errorOnly) or in all cases (on). Possible values: errorOnly, on, off")]
        [MBS.Agent.Plan.Notification]
        $AddEventToWindowsLog = 'off',
        # ---------------------------- Retention Policy -------------------------
        #
        [Parameter(Mandatory=$True, HelpMessage="Keep versions for specified number of days. Set 0 to keep all versions or specify number of days. Example: -KeepVersionPeriod 180", ParameterSetName='FFI')]
        [Parameter(Mandatory=$False, HelpMessage="Keep versions for specified number of days. Set 0 to keep all versions or specify number of days. Example: -KeepVersionPeriod 180", ParameterSetName='GFS')]
        [int]
        $KeepVersionPeriod,
        #
        [Parameter(Mandatory=$False, HelpMessage="Enables GFS weekly storage type. Example: -KeepVersionPeriod 4", ParameterSetName='GFS')]
        [ValidateRange(0,100000)]
        [int]
        $GFSKeepWeekly = 0,
        #
        [Parameter(Mandatory=$False, HelpMessage="Enables GFS monthly storage type. Example: -KeepVersionPeriod 12", ParameterSetName='GFS')]
        [ValidateRange(0,10000)]
        [int]
        $GFSKeepMonthly = 0,
        #
        [Parameter(Mandatory=$False, HelpMessage="Enables GFS yearly storage type. Example: -KeepVersionPeriod 5", ParameterSetName='GFS')]
        [ValidateRange(0,1000)]
        [int]
        $GFSKeepYearly = 0,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify the number of month for the first successful GFS full backup for yearly storage type. Example: -GFSMonthOfTheYear February", ParameterSetName='GFS')]
        [MBS.Agent.Plan.Month]
        $GFSMonthOfTheYear = "NotSet",
        #
        [Parameter(Mandatory=$False, HelpMessage='Enables Intelligent Retention for Forever Forward Incremental. Possible values: $true/$false. By default set to $true if Forever Forward Incremental is enabled', ParameterSetName='FFI')]
        [boolean]
        $IntelligentRetention=$True
    )
    
    begin {
        
    }
    
    process {
        $BackupPlanOption = New-Object -TypeName MBS.Agent.Plan.NBFBackupPlanCommonOption
        $BackupPlanOption.SyncRepositoryBeforeRun = $SyncRepositoryBeforeRun
        $BackupPlanOption.UseServerSideEncryption = $UseServerSideEncryption
        $BackupPlanOption.EncryptionAlgorithm = $EncryptionAlgorithm
        $BackupPlanOption.EncryptionPassword = $EncryptionPassword
        $BackupPlanOption.UseCompression = $UseCompression
        $BackupPlanOption.StorageClass = $StorageClass
        $BackupPlanOption.FullConsistencyCheck = $FullConsistencyCheck
        $BackupPlanOption.StopIfPlanRunsFor = $StopIfPlanRunsFor
        $BackupPlanOption.RunMissedPlanImmediately = $RunMissedPlanImmediately
        $BackupPlanOption.ForeverForwardIncremental = $ForeverForwardIncremental
        $BackupPlanOption.PreActionCommand = $PreActionCommand
        $BackupPlanOption.PreActionContinueAnyway = $PreActionContinueAnyway
        $BackupPlanOption.PostActionCommand = $PostActionCommand
        $BackupPlanOption.PostActionRunAnyway = $PostActionRunAnyway
        $BackupPlanOption.BackupChainPlanID = $BackupChainPlanID
        $BackupPlanOption.BackupChainExecuteOnlyAfterSuccess = $BackupChainExecuteOnlyAfterSuccess
        $BackupPlanOption.BackupChainExecuteForceFull = $BackupChainExecuteForceFull
        $BackupPlanOption.ResultEmailNotification = $ResultEmailNotification
        $BackupPlanOption.AddEventToWindowsLog = $AddEventToWindowsLog
        if($null -ne $KeepVersionPeriod){$BackupPlanOption.KeepVersionPeriod = $KeepVersionPeriod}
        if($null -ne $GFSKeepWeekly){$BackupPlanOption.GFSKeepWeekly = $GFSKeepWeekly}
        if($null -ne $GFSKeepMonthly){$BackupPlanOption.GFSKeepMonthly = $GFSKeepMonthly}
        if($null -ne $GFSKeepYearly){$BackupPlanOption.GFSKeepYearly = $GFSKeepYearly}
        $BackupPlanOption.GFSMonthOfTheYear = $GFSMonthOfTheYear
        $BackupPlanOption.IntelligentRetention = $IntelligentRetention
        return $BackupPlanOption
    }
    
    end {
        
    }
}
# SIG # Begin signature block
