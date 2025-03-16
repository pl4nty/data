function New-MBSBackupPlanCommonOption {
    <#
    .SYNOPSIS
    Returns MBS.Agent.Plan.BackupPlanCommonOption type object with common backup plan options.
    
    .DESCRIPTION
    Create BackupPlanCommonOption type object with common backup plan options. Used with New-MBSBackupPlan cmdlet.
    
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
    
    .PARAMETER SaveBackupPlanConfiguration
    Save backup plan configuration to the backup storage
    
    .PARAMETER StopIfPlanRunsFor
    Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -StopIfPlanRunsFor "20:30" or -StopIfPlanRunsFor "100:00 etc.
    
    .PARAMETER RunMissedPlanImmediately
    Run missed scheduled backup immediately when computer starts up.
    
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
    
    .PARAMETER KeepNumberOfVersion
    Keep limited number of versions. Possible values: 0 to keep all version or specific number of versions
    
    .PARAMETER KeepLastVersion
    Always keep the last version.
    
    .PARAMETER DelayPurgePeriod
    Specify purge delay. Omit to use defult retention policy, set 0 to purge version withour delay or specify number of days. Example: -DelayPurgePeriod 180
    
    .EXAMPLE
    $CommonOptions = New-MBSBackupPlanCommonOption -SyncRepositoryBeforeRun $true -UseServerSideEncryption $true -EncryptionAlgorithm AES256 -EncryptionPassword (ConvertTo-SecureString -string "My_Password" -AsPlainText -Force) -UseCompression $true -StorageClass OneZoneIA -SaveBackupPlanConfiguration $true -StopIfPlanRunsFor 10:00
    
    Create backup plan common options object.

    .INPUTS
        None.

    .OUTPUTS
        MBS.Agent.Plan.BackupPlanCommonOption

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsbackupplancommonoption
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
        [Parameter(Mandatory=$False, HelpMessage="Save backup plan configuration to the backup storage")]
        [boolean]
        $SaveBackupPlanConfiguration=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -StopIfPlanRunsFor ""20:30"" or -StopIfPlanRunsFor ""100:00"" etc.")]
        [ValidatePattern("^([01]?[0-9]|2[0-3]):[0-5][0-9]:[0][0]$")]
        [timespan]
        $StopIfPlanRunsFor='00:00',
        #
        [Parameter(Mandatory=$False, HelpMessage='Run missed scheduled backup immediately when computer starts up. Possible values: $true/$false', ParameterSetName='Common')]
        [boolean]
        $RunMissedPlanImmediately=$False,
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
        [Parameter(Mandatory=$False, HelpMessage="Keep versions for specified number of days. Omit to use defult retention policy, set 0 to keep all versions or specify number of days. Example: -KeepVersionPeriod 180")]
        [Nullable[int]]
        $KeepVersionPeriod,
        #
        [Parameter(Mandatory=$False, HelpMessage="Keep limited number of versions. Possible values: 0 to keep all version or specific number of versions")]
        [Nullable[int32]]
        $KeepNumberOfVersion,
        #
        [Parameter(Mandatory=$False, HelpMessage='Always keep the last version. Possible values: $true/$false')]
        [boolean]
        $KeepLastVersion=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify purge delay. Omit to use defult retention policy, set 0 to purge version withour delay or specify number of days. Example: -DelayPurgePeriod 180")]
        [Nullable[int]]
        $DelayPurgePeriod
    )
    
    begin {
        
    }
    
    process {
        $BackupPlanOption = New-Object -TypeName MBS.Agent.Plan.BackupPlanCommonOption
        $BackupPlanOption.SyncRepositoryBeforeRun = $SyncRepositoryBeforeRun
        $BackupPlanOption.UseServerSideEncryption = $UseServerSideEncryption
        $BackupPlanOption.UseServerSideEncryption = $UseServerSideEncryption
        $BackupPlanOption.EncryptionAlgorithm = $EncryptionAlgorithm
        $BackupPlanOption.EncryptionPassword = $EncryptionPassword
        $BackupPlanOption.UseCompression = $UseCompression
        $BackupPlanOption.StorageClass = $StorageClass
        $BackupPlanOption.SaveBackupPlanConfiguration = $SaveBackupPlanConfiguration
        $BackupPlanOption.StopIfPlanRunsFor = $StopIfPlanRunsFor
        $BackupPlanOption.RunMissedPlanImmediately = $RunMissedPlanImmediately
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
        $BackupPlanOption.KeepNumberOfVersion = $KeepNumberOfVersion
        $BackupPlanOption.KeepLastVersion = $KeepLastVersion
        if($null -ne $DelayPurgePeriod){$BackupPlanOption.DelayPurgePeriod = $DelayPurgePeriod}
        return $BackupPlanOption
    }
    
    end {
        
    }
}
# SIG # Begin signature block
