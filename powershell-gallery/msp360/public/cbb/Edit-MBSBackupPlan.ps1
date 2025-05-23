function Edit-MBSBackupPlan {
    <#
    .SYNOPSIS
        Edit CBF (legacy) backup plan.
    .DESCRIPTION
        Edit legacy backup format (CBF) backup plan. File-Level and Image-Based backup plan type are supported.
    .PARAMETER FileLevelParameterSet
        Backup plan settings related to File-Level backup plan type
    .PARAMETER ImageBasedParameterSet
        Backup plan settings related to Image-Based backup plan type
    .PARAMETER CommonParameterSet
        Backup plan settings related to any backup plan type. Such as Encryption, Compression, Retention policy, Schedule, etc.
    .PARAMETER ID
        Backup plan ID
    .PARAMETER Name
        Backup plan name
    .PARAMETER SpecialFunction
        Specific procedure which covers a particular use case related to changes for a plan. Possible values: ExcludeEncryptedFiles, ExcludeTempWindowsAppsFolders, ExcludeOneDriveFolders, AddFixedDrivesToIBB, AddFixedDrivesToFileLevel, DisablePreAction
    .PARAMETER StorageAccountID
        Specify to change storage account. Use Get-MBSStorageAccount to list storages
    .PARAMETER NewName
        Specify to rename plan
    .PARAMETER DisableEncryption
        Specify to disable encryption
    .PARAMETER DisableSchedule
        Specify to disable schedule
    .PARAMETER SyncBeforeRun
        Run consistency check before the plan
    .PARAMETER ServerSideEncryption
        Use server side encryption (valid only for Amazon S3)
    .PARAMETER EncryptionAlgorithm
        Enable AES encryption algorithm. Possible values: AES128, AES192, AES256
    .PARAMETER EncryptionPassword
        Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)
    .PARAMETER Compression
        Enable compression
    .PARAMETER StorageClass
        Storage Class (valid only for Amazon S3). Possible values: Standard, IntelligentTiering, StandardIA, OneZoneIA, Glacier, GlacierInstantRetrieval, GlacierDeepArchive
    .PARAMETER SaveBPConfiguration
        Save backup plan configuration to the backup storage
    .PARAMETER MasterPassword
        Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)
    .PARAMETER runMissed
        Run missed scheduled backup immediately when computer starts up
    .PARAMETER RecurringType
        Specify schedule recurring type. Possible values: day, week, month, dayofmonth, real-time
    .PARAMETER At
        Specify datetime or time of schedule. Example -at ""06/09/19 7:43 AM"" , or -at ""7:43 AM""
    .PARAMETER DayOfMonth
        Specify day for 'dayofmonth' schedule (1..31)
    .PARAMETER WeekDay
        Specify day(s) of week for weekly schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly schedule
    .PARAMETER WeekNumber
        Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last
    .PARAMETER DailyFrom
        Specify daily recurring from value
    .PARAMETER DailyTill
        Specify daily recurring till value
    .PARAMETER Occurs
        Specify recurring period type. Possible values: hour, min
    .PARAMETER OccurValue
        Specify recurring period value
    .PARAMETER RepeatEvery
        Specify repeat period value. Possible values: 1..31
    .PARAMETER repeatStartDate
        Specify start date of repetitions
    .PARAMETER stopAfter
        Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -stopAfter ""20:30"" or -stopAfter ""100:00"" etc.
    .PARAMETER preActionEnabled
        Enables the pre-action
    .PARAMETER preActionCommand
        Specify command to be executed before the backup plan runs
    .PARAMETER preActionContinueAnyway
        Specify to continue backup plan if pre-backup action failed. Possible values: $true/$false
    .PARAMETER postActionEnabled
        Enables the post-action
    .PARAMETER postActionCommand
        Specify command to be executed after backup is completed
    .PARAMETER postActionRunAnyway
        Specify to execute post-backup action in any case (regardless of the backup result). Possible values: $true/$false
    .PARAMETER notification
        Specify to receive notification email when backup fails (errorOnly) or in all cases (on). Prior to turn on the notification settings must be configured. Possible values: errorOnly, on, off
    .PARAMETER winLog
        Specify to add entry to Windows Event Log when backup fails (errorOnly) or in all cases (on). Possible values: errorOnly, on, off
    .PARAMETER DisableBackupChain
        Specify to disable next/chained plan execution
    .PARAMETER BackupChainPlanID
        Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plans name').ID
    .PARAMETER BackupChainExecuteOnlyAfterSuccess
        Specify to execute the chained plan only if the current plan is completed successfully ($true) or always ($false)
    .PARAMETER BackupChainExecuteForceFull
        Specify to force full backup for the chained plan. Possible values: $true/$false
    .PARAMETER KeepVersionPeriod
        Purge versions that are older than period (except lastest version). Possible values: no, 1d(day), 1w(week), 1m(month)
    .PARAMETER KeepNumberOfVersions
        Keep limited number of versions. Possible values: all, number
    .PARAMETER keepLastVersion
        Always keep the last version. Possible values: $true/$false
    .PARAMETER delayPurge
        Specify purge delay. Possible values: no, 1d(day), 1w(week), 1m(month)
    .PARAMETER RecurringTypeForceFull
        Specify force full schedule recurring type. Possible values: day, week, month, dayofmonth
    .PARAMETER atForceFull
        Specify datetime or time of force full schedule. Example -atForceFull ""06/09/19 7:43 AM"" , or -atForceFull ""7:43 AM""
    .PARAMETER DayOfMonthForceFull
        Specify day for 'dayofmonth' force full schedule (1..31)
    .PARAMETER weekdayForceFull
        Specify day(s) of week for weekly force full schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly force full schedule
    .PARAMETER weeknumberForceFull
        Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last
    .PARAMETER dailyFromForceFull
        Specify daily force full recurring from value
    .PARAMETER dailyTillForceFull
        Specify daily force full recurring till value
    .PARAMETER occursForceFull
        Specify force full recurring period type. Possible values: hour, min
    .PARAMETER occurValueForceFull
        Specify force full recurring period value
    .PARAMETER repeatEveryForceFull
        Specify force full repeat period value. Possible values: 1..31
    .PARAMETER repeatStartDateForceFull
        Specify force full start date of repetitions
    .PARAMETER rebackupDate
        Specify rebackup datetime. Example: ""06/09/19 7:43 AM""
    .PARAMETER DisableForceFullSchedule
        Specify to disable schedule of forced full backup
    .PARAMETER SyntheticFull
        Use Synthetic Full backup (this parameter is NOT supported for all storage providers). Possible values: $true/$false
    .PARAMETER useBlockLevelBackup
        Use block level backup. Possible values: $true/$false
    .PARAMETER UseFastNTFSScan
        The Fast NTFS scan speeds up backup processing by using a low-level API for accessing NTFS structures. This option is useful for NTFS volumes with a large number of files. Enabling this option automatically enables ForceUsingVSS option. Possible values: $true/$false
    .PARAMETER BackupNTFSPermissions
        Backup NTFS permissions. Possible values: $true/$false
    .PARAMETER ForceUsingVSS
        Force using VSS (Volume Shadow Copy Service). Cannot be disabled if UseFastNTFSScan is enabled. Possible values: $true/$false
    .PARAMETER UseShareReadWriteModeOnError
        Use share read/write mode on errors. Can help if file is open in share read/write mode. Possible values: $true/$false
    .PARAMETER DeleteLocallyDeletedFilesAfter
        Delete files that have been deleted locally after specified number of days. Example: ""-df 30""
    .PARAMETER BackupEmptyFolders
        Backup empty folders. Possible values: $true/$false
    .PARAMETER BackupOnlyAfter
        Backup files only after specific date. Example: ""06/09/19 7:43 AM""
    .PARAMETER ExcludeSystemHiddenFiles
        Exclude system and hidden files and folders. Possible values: $true/$false
    .PARAMETER SkipFolders
        Skip folders with specified names (recursively). Example: -SkipFolders ""bin"",""*temp*"",""My*""
    .PARAMETER IncludeFilesMask
        Select files by mask to include in the backup plan. Example: -ifm ""*.doc"",""*.xls""
    .PARAMETER ExcludeFilesMask
        Select files by mask to exclude from the backup plan. Example: -efm ""*.bak"",""*.tmp""
    .PARAMETER IgnoreErrorPathNotFound
        Ignore path not found errors. Possible values: $true/$false
    .PARAMETER TrackDeletedFiles
        Track deleted files. Possible values: $true/$false
    .PARAMETER AddNewFile
        Add a new file to backup plan
    .PARAMETER AddNewDirectory
        Add a new directory to backup plan
    .PARAMETER ExcludeFile
        Exclude a file from backup plan
    .PARAMETER ExcludeDirectory
        Exclude a directory from backup plan
    .PARAMETER BackupFile
        Specify files to backup
    .PARAMETER BackupDirectory
        Specify directories to backup
    .PARAMETER GenerateDetailedReport
        Specify to generate detailed report. Possible values: $true/$false
    .PARAMETER BackupVolumes
        Type of volumes to backup. Possible values: AllVolumes, SystemRequired, SelectedVolumes
    .PARAMETER Volumes
        Backup selected volumes with the specified IDs. Example: -Volumes ((Get-MBSDiskVolume).Volumes | Where {`$_.RequiredBySystem -eq `$true}).WindowsVolumeIdentity
    .PARAMETER disableVSS
        Disable VSS, use direct access to NTFS volume. Possible values: $true/$false
    .PARAMETER KeepBitLocker
        Enable or disable KeepBitLocker option for all partitions. Possible values: $true/$false
    .PARAMETER ignoreBadSectors
        Ignore bad sectors. Possible values: $true/$false
    .PARAMETER useSystemVSS
        Use system VSS provider. Possible values: $true/$false
    .PARAMETER prefetchBlockCount
        Prefetch block count (0 - 100, 0 without prefetch)
    .PARAMETER blockSize
        Block size. Possible values: 128, 256, 512, 1024
    .PARAMETER ExcludeItem
        Exclude files/folders from Image-Based backup plan
    .PARAMETER DisableExcludeFilesFolders
        Disable the 'Exclude files/folders' option in Image-Based backup plan
    .PARAMETER KeepBitLockerEnableForVolume
        Enable KeepBitLocker option for volumes with specified ids
    .PARAMETER KeepBitLockerDisableForVolume
        Disable KeepBitLocker option for volumes with specified ids
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan | Edit-MBSBackupPlan -CommonParameterSet -Compression $true
        Enable compression option for all supported backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -PlanType File-Level | Edit-MBSBackupPlan -FileLevelParameterSet -ntfs $true
        Enable backup NTFS permissions option for all file-level backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -PlanType Image-Based | Edit-MBSBackupPlan -ImageBasedParameterSet -BackupVolumes SystemRequired
        Add only system required volumes to all image-based backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType Cloud -PlanType Image-Based | Edit-MBSBackupPlan -ImageBasedParameterSet -BackupVolumes SystemRequired
        Add only system required volumes to cloud image-based backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType Cloud | Edit-MBSBackupPlan -ImageBasedParameterSet -KeepBitLocker $true
        Enable KeepBitLocker option for all cloud backup plans.
    .INPUTS
        System.Management.Automation.PSCustomObject
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/edit-mbsbackupplan
    #>

    [CmdletBinding(DefaultParameterSetName='Common')]
    param (
        #
        [Parameter(Mandatory=$True, HelpMessage="Backup plan settings related to File-Level backup plan type", ParameterSetName='FileLevel')]
        [switch]
        $FileLevelParameterSet,
        #
        [Parameter(Mandatory=$True, HelpMessage="Backup plan settings related to Image-Based backup plan type", ParameterSetName='ImageBased')]
        [switch]
        $ImageBasedParameterSet,
        #
        [Parameter(Mandatory=$True, HelpMessage="Backup plan settings related to any backup plan type. Such as Encryption, Compression, Retention policy, Schedule, etc.", ParameterSetName='Common')]
        [switch]
        $CommonParameterSet,
        #
        [Parameter(ValueFromPipelineByPropertyName, HelpMessage="Backup plan ID")]
        [string]
        $ID,
        #
        [Parameter(ValueFromPipelineByPropertyName, HelpMessage="Backup plan name")]
        [string]
        $Name,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specific procedure which covers a particular use case related to changes for a plan. Possible values: ExcludeEncryptedFiles, ExcludeTempWindowsAppsFolders, ExcludeOneDriveFolders, AddFixedDrivesToIBB, AddFixedDrivesToFileLevel, DisablePreAction", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specific procedure which covers a particular use case related to changes for a plan. Possible values: ExcludeEncryptedFiles, ExcludeTempWindowsAppsFolders, ExcludeOneDriveFolders, AddFixedDrivesToIBB, AddFixedDrivesToFileLevel, DisablePreAction", ParameterSetName='FileLevel')]
        [ValidateSet("ExcludeEncryptedFiles", "ExcludeTempWindowsAppsFolders","ExcludeOneDriveFolders","AddFixedDrivesToIBB", "AddFixedDrivesToFileLevel", "DisablePreAction")]
        [string]
        $SpecialFunction,
        # 
        [Parameter(Mandatory=$False, HelpMessage="Specify to change storage account. Use Get-MBSStorageAccount to list storages", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to change storage account. Use Get-MBSStorageAccount to list storages", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to change storage account. Use Get-MBSStorageAccount to list storages", ParameterSetName='FileLevel')]
        [string]
        $StorageAccountID,
        # 
        [Parameter(Mandatory=$False, HelpMessage="Specify to rename plan", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to rename plan", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to rename plan", ParameterSetName='FileLevel')]
        [String]
        $NewName,
        # 
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable encryption", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable encryption", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable encryption", ParameterSetName='FileLevel')]
        [switch]
        $DisableEncryption,
        # 
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable schedule", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable schedule", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable schedule", ParameterSetName='FileLevel')]
        [switch]
        $DisableSchedule,
        #
        [Parameter(Mandatory=$False, HelpMessage="Run consistency check before the plan", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Run consistency check before the plan", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Run consistency check before the plan", ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $SyncBeforeRun,
        #
        [Parameter(Mandatory=$False, HelpMessage="Use server side encryption (valid only for Amazon S3)", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Use server side encryption (valid only for Amazon S3)", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Use server side encryption (valid only for Amazon S3)", ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $ServerSideEncryption,
        #
        [Parameter(Mandatory=$False, HelpMessage="Enable AES encryption algorithm. Possible values: AES128, AES192, AES256", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Enable AES encryption algorithm. Possible values: AES128, AES192, AES256", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Enable AES encryption algorithm. Possible values: AES128, AES192, AES256", ParameterSetName='FileLevel')]
        [ValidateSet("AES128", "AES192","AES256")]
        [String]
        $EncryptionAlgorithm,
        #
        [Parameter(Mandatory=$False, HelpMessage="Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Encryption password. Use -EncryptionPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='FileLevel')]
        [SecureString]
        $EncryptionPassword,
        #
        [Parameter(Mandatory=$False, HelpMessage="Enable compression", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Enable compression", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Enable compression", ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $Compression,
        #
        [Parameter(Mandatory=$False, HelpMessage="Storage Class (valid only for Amazon S3). Possible values: Standard, IntelligentTiering, StandardIA, OneZoneIA, Glacier, GlacierInstantRetrieval, GlacierDeepArchive", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Storage Class (valid only for Amazon S3). Possible values: Standard, IntelligentTiering, StandardIA, OneZoneIA, Glacier, GlacierInstantRetrieval, GlacierDeepArchive", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Storage Class (valid only for Amazon S3). Possible values: Standard, IntelligentTiering, StandardIA, OneZoneIA, Glacier, GlacierInstantRetrieval, GlacierDeepArchive", ParameterSetName='FileLevel')]
        [ValidateSet("Standard", "IntelligentTiering", "StandardIA", "OneZoneIA", "Glacier", "GlacierInstantRetrieval", "GlacierDeepArchive")]
        [String]
        $StorageClass,
        #
        [Parameter(Mandatory=$False, HelpMessage="Save backup plan configuration to the backup storage", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Save backup plan configuration to the backup storage", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Save backup plan configuration to the backup storage", ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $SaveBPConfiguration,
        #
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='FileLevel')]
        [SecureString]
        $MasterPassword,
        # ------------------------- Schedule -----------------------------
        [Parameter(Mandatory=$False, HelpMessage='Run missed scheduled backup immediately when computer starts up', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Run missed scheduled backup immediately when computer starts up', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Run missed scheduled backup immediately when computer starts up', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $runMissed,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule recurring type. Possible values: day, week, month, dayofmonth, real-time", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule recurring type. Possible values: day, week, month, dayofmonth, real-time", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule recurring type. Possible values: day, week, month, dayofmonth, real-time", ParameterSetName='FileLevel')]
        [ValidateSet("day", "week", "month", "dayofmonth", "real-time")]
        [String]
        $RecurringType,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify datetime or time of schedule. Example -at ""06/09/19 7:43 AM"" , or -at ""7:43 AM""", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify datetime or time of schedule. Example -at ""06/09/19 7:43 AM"" , or -at ""7:43 AM""", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify datetime or time of schedule. Example -at ""06/09/19 7:43 AM"" , or -at ""7:43 AM""", ParameterSetName='FileLevel')]
        [String]
        $At,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' schedule (1..31)", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' schedule (1..31)", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' schedule (1..31)", ParameterSetName='FileLevel')]
        [Int32][ValidateRange(1,31)]
        $DayOfMonth,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly schedule", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly schedule", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly schedule", ParameterSetName='FileLevel')]
        [ValidateSet("su", "mo", "tu", "we", "th", "fr", "sa")]
        [string[]]
        $WeekDay,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='FileLevel')]
        [ValidateSet("First", "Second", "Third", "Fourth", "Penultimate", "Last")]
        [string]
        $WeekNumber,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring from value", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring from value", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring from value", ParameterSetName='FileLevel')]
        [string]
        $DailyFrom,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring till value", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring till value", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily recurring till value", ParameterSetName='FileLevel')]
        [string]
        $DailyTill,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period type. Possible values: hour, min", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period type. Possible values: hour, min", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period type. Possible values: hour, min", ParameterSetName='FileLevel')]
        [ValidateSet("hour", "min")]
        [string]
        $Occurs,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period value", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period value", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify recurring period value", ParameterSetName='FileLevel')]
        [Alias("OccursValue")]
        [string]
        $OccurValue,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value. Possible values: 1..31", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value. Possible values: 1..31", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify repeat period value. Possible values: 1..31", ParameterSetName='FileLevel')]
        [Int32][ValidateRange(1,31)]
        $RepeatEvery,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify start date of repetitions", ParameterSetName='FileLevel')]
        [string]
        $repeatStartDate,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -stopAfter ""20:30"" or -stopAfter ""100:00"" etc.", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -stopAfter ""20:30"" or -stopAfter ""100:00"" etc.", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -stopAfter ""20:30"" or -stopAfter ""100:00"" etc.", ParameterSetName='FileLevel')]
        [string]
        $stopAfter,
        # ------------------ Pre / Post actions ----------------------------
        [Parameter(Mandatory=$False, HelpMessage="Enables the pre-action", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Enables the pre-action", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Enables the pre-action", ParameterSetName='FileLevel')]
        [Alias("prae")]
        [Nullable[boolean]]
        $preActionEnabled,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify command to be executed before the backup plan runs", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify command to be executed before the backup plan runs", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify command to be executed before the backup plan runs", ParameterSetName='FileLevel')]
        [Alias("preAction")]
        [string]
        $preActionCommand,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to continue backup plan if pre-backup action failed. Possible values: $true/$false', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to continue backup plan if pre-backup action failed. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to continue backup plan if pre-backup action failed. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Alias("pac")]
        [Nullable[boolean]]
        $preActionContinueAnyway,
        #
        [Parameter(Mandatory=$False, HelpMessage="Enables the post-action", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Enables the post-action", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Enables the post-action", ParameterSetName='FileLevel')]
        [Alias("ppae")]
        [Nullable[boolean]]
        $postActionEnabled,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify command to be executed after backup is completed", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify command to be executed after backup is completed", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify command to be executed after backup is completed", ParameterSetName='FileLevel')]
        [Alias("postAction")]
        [string]
        $postActionCommand,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to execute post-backup action in any case (regardless of the backup result). Possible values: $true/$false', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to execute post-backup action in any case (regardless of the backup result). Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to execute post-backup action in any case (regardless of the backup result). Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Alias("paa")]
        [Nullable[boolean]]
        $postActionRunAnyway,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify to receive notification email when backup fails (errorOnly) or in all cases (on). Prior to turn on the notification settings must be configured. Possible values: errorOnly, on, off", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to receive notification email when backup fails (errorOnly) or in all cases (on). Prior to turn on the notification settings must be configured. Possible values: errorOnly, on, off", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to receive notification email when backup fails (errorOnly) or in all cases (on). Prior to turn on the notification settings must be configured. Possible values: errorOnly, on, off", ParameterSetName='FileLevel')]
        [ValidateSet("errorOnly", "on", "off")]
        [string]
        $notification,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify to add entry to Windows Event Log when backup fails (errorOnly) or in all cases (on). Possible values: errorOnly, on, off", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to add entry to Windows Event Log when backup fails (errorOnly) or in all cases (on). Possible values: errorOnly, on, off", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to add entry to Windows Event Log when backup fails (errorOnly) or in all cases (on). Possible values: errorOnly, on, off", ParameterSetName='FileLevel')]
        [ValidateSet("errorOnly", "on", "off")]
        [string]
        $winLog,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to disable next/chained plan execution', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to disable next/chained plan execution', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to disable next/chained plan execution', ParameterSetName='FileLevel')]
        [switch]
        $DisableBackupChain,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plans name').ID", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plans name').ID", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plans name').ID", ParameterSetName='FileLevel')]
        [string]
        $BackupChainPlanID,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to execute the chained plan only if the current plan is completed successfully ($true) or always ($false)', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to execute the chained plan only if the current plan is completed successfully ($true) or always ($false)', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to execute the chained plan only if the current plan is completed successfully ($true) or always ($false)', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $BackupChainExecuteOnlyAfterSuccess,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to force full backup for the chained plan. Possible values: $true/$false', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to force full backup for the chained plan. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to force full backup for the chained plan. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $BackupChainExecuteForceFull,
        # ---------------------------- Retention Policy -------------------------
        
        [Parameter(Mandatory=$False, HelpMessage="Purge versions that are older than period (except lastest version). Possible values: no, 1d(day), 1w(week), 1m(month)", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Purge versions that are older than period (except lastest version). Possible values: no, 1d(day), 1w(week), 1m(month)", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Purge versions that are older than period (except lastest version). Possible values: no, 1d(day), 1w(week), 1m(month)", ParameterSetName='FileLevel')]
        [Alias("purge")]
        [string]
        $KeepVersionPeriod,
        #
        [Parameter(Mandatory=$False, HelpMessage="Keep limited number of versions. Possible values: all, number", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Keep limited number of versions. Possible values: all, number", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Keep limited number of versions. Possible values: all, number", ParameterSetName='FileLevel')]
        [Alias("keep")]
        [string]
        $KeepNumberOfVersions,
        #
        [Parameter(Mandatory=$False, HelpMessage='Always keep the last version. Possible values: $true/$false', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Always keep the last version. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Always keep the last version. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $keepLastVersion,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify purge delay. Possible values: no, 1d(day), 1w(week), 1m(month)", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify purge delay. Possible values: no, 1d(day), 1w(week), 1m(month)", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify purge delay. Possible values: no, 1d(day), 1w(week), 1m(month)", ParameterSetName='FileLevel')]
        [string]
        $delayPurge,
        #-------------------------Full schedule -----------------------------------
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule recurring type. Possible values: day, week, month, dayofmonth", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule recurring type. Possible values: day, week, month, dayofmonth", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule recurring type. Possible values: day, week, month, dayofmonth", ParameterSetName='FileLevel')]
        [ValidateSet("day", "week", "month", "dayofmonth")]
        [string]
        $RecurringTypeForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify datetime or time of force full schedule. Example -atForceFull ""06/09/19 7:43 AM"" , or -atForceFull ""7:43 AM""", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify datetime or time of force full schedule. Example -atForceFull ""06/09/19 7:43 AM"" , or -atForceFull ""7:43 AM""", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify datetime or time of force full schedule. Example -atForceFull ""06/09/19 7:43 AM"" , or -atForceFull ""7:43 AM""", ParameterSetName='FileLevel')]
        [string]
        $atForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' force full schedule (1..31)", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' force full schedule (1..31)", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' force full schedule (1..31)", ParameterSetName='FileLevel')]
        [Int32][ValidateRange(1,31)]
        [Alias("dayForceFull")]
        $DayOfMonthForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly force full schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly force full schedule", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly force full schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly force full schedule", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly force full schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly force full schedule", ParameterSetName='FileLevel')]
        [ValidateSet("su", "mo", "tu", "we", "th", "fr", "sa")]
        [string[]]
        $weekdayForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify number of week. Possible values: First, Second, Third, Fourth, Penultimate, Last", ParameterSetName='FileLevel')]
        [ValidateSet("First", "Second", "Third", "Fourth", "Penultimate", "Last")]
        [string]
        $weeknumberForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify daily force full recurring from value", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily force full recurring from value", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily force full recurring from value", ParameterSetName='FileLevel')]
        [string]
        $dailyFromForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify daily force full recurring till value", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily force full recurring till value", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify daily force full recurring till value", ParameterSetName='FileLevel')]
        [string]
        $dailyTillForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify force full recurring period type. Possible values: hour, min", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full recurring period type. Possible values: hour, min", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full recurring period type. Possible values: hour, min", ParameterSetName='FileLevel')]
        [ValidateSet("hour", "min")]
        [string]
        $occursForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify force full recurring period value", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full recurring period value", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full recurring period value", ParameterSetName='FileLevel')]
        [string]
        $occurValueForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify force full repeat period value. Possible values: 1..31", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full repeat period value. Possible values: 1..31", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full repeat period value. Possible values: 1..31", ParameterSetName='FileLevel')]
        [Int32][ValidateRange(1,31)]
        $repeatEveryForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify force full start date of repetitions", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full start date of repetitions", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full start date of repetitions", ParameterSetName='FileLevel')]
        [string]
        $repeatStartDateForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify rebackup datetime. Example: ""06/09/19 7:43 AM""", ParameterSetName='FileLevel')]
        [string]
        $rebackupDate,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable schedule of forced full backup", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable schedule of forced full backup", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable schedule of forced full backup", ParameterSetName='FileLevel')]
        [switch]
        $DisableForceFullSchedule,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use Synthetic Full backup (this parameter is NOT supported for all storage providers). Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Nullable[boolean]]
        $SyntheticFull,
        #---------------------------- Block Level ------------------
        [Parameter(Mandatory=$False, HelpMessage='Use block level backup. Possible values: $true/$false', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Use block level backup. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Use block level backup. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $useBlockLevelBackup,
        # --------------------------- File Backup settings ------------
        [Parameter(Mandatory=$False, HelpMessage='The Fast NTFS scan speeds up backup processing by using a low-level API for accessing NTFS structures. This option is useful for NTFS volumes with a large number of files. Enabling this option automatically enables ForceUsingVSS option. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $UseFastNTFSScan,
        #
        [Parameter(Mandatory=$False, HelpMessage='Backup NTFS permissions. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $BackupNTFSPermissions,
        #
        [Parameter(Mandatory=$False, HelpMessage='Force using VSS (Volume Shadow Copy Service). Cannot be disabled if UseFastNTFSScan is enabled. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $ForceUsingVSS,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use share read/write mode on errors. Can help if file is open in share read/write mode. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $UseShareReadWriteModeOnError,
        #
        [Parameter(Mandatory=$False, HelpMessage="Delete files that have been deleted locally after specified number of days. Example: ""-df 30""", ParameterSetName='FileLevel')]
        [Alias("df")]        
        [string]
        $DeleteLocallyDeletedFilesAfter,
        #
        [Parameter(Mandatory=$False, HelpMessage='Backup empty folders. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $BackupEmptyFolders,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup files only after specific date. Example: ""06/09/19 7:43 AM""", ParameterSetName='FileLevel')]
        [Alias("oa")]        
        [string]
        $BackupOnlyAfter,
        #
        [Parameter(Mandatory=$False, HelpMessage='Exclude system and hidden files and folders. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Alias("es")]        
        [Nullable[boolean]]
        $ExcludeSystemHiddenFiles,
        #
        [Parameter(Mandatory=$False, HelpMessage="Skip folders with specified names (recursively). Example: -SkipFolders ""bin"",""*temp*"",""My*""", ParameterSetName='FileLevel')]
        [string[]]
        $SkipFolders,
        #
        [Parameter(Mandatory=$False, HelpMessage="Select files by mask to include in the backup plan. Example: -ifm ""*.doc"",""*.xls""", ParameterSetName='FileLevel')]
        [string[]]
        $IncludeFilesMask,
        #
        [Parameter(Mandatory=$False, HelpMessage="Select files by mask to exclude from the backup plan. Example: -efm ""*.bak"",""*.tmp""", ParameterSetName='FileLevel')]
        [string[]]
        $ExcludeFilesMask,
        #
        [Parameter(Mandatory=$False, HelpMessage='Ignore path not found errors. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Alias("iepnf")]        
        [Nullable[boolean]]
        $IgnoreErrorPathNotFound,
        #
        [Parameter(Mandatory=$False, HelpMessage='Track deleted files. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $TrackDeletedFiles,
        #
        [Parameter(Mandatory=$False, HelpMessage="Add a new file to backup plan", ParameterSetName='FileLevel')]
        [string[]]
        $AddNewFile,
        #
        [Parameter(Mandatory=$False, HelpMessage="Add a new directory to backup plan", ParameterSetName='FileLevel')]
        [string[]]
        $AddNewDirectory,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude a file from backup plan", ParameterSetName='FileLevel')]
        [string[]]
        $ExcludeFile,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude a directory from backup plan", ParameterSetName='FileLevel')]
        [string[]]
        $ExcludeDirectory,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify files to backup", ParameterSetName='FileLevel')]
        [string[]]
        $BackupFile,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify directories to backup", ParameterSetName='FileLevel')]
        [string[]]
        $BackupDirectory,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to generate detailed report. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $GenerateDetailedReport,
        # ------------------------- Image-Based --------------------------------------
        [Parameter(Mandatory=$False, HelpMessage="Type of volumes to backup. Possible values: AllVolumes, SystemRequired, SelectedVolumes", ParameterSetName='ImageBased')]
        [ValidateSet("AllVolumes", "SystemRequired", "SelectedVolumes")]
        [string]
        $BackupVolumes,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup selected volumes with the specified IDs. Example: -Volumes ((Get-MBSDiskVolume).Volumes | Where {`$_.RequiredBySystem -eq `$true}).WindowsVolumeIdentity", ParameterSetName='ImageBased')]
        [string[]]
        $Volumes,
        #
        [Parameter(Mandatory=$False, HelpMessage='Disable VSS, use direct access to NTFS volume. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Nullable[boolean]]
        $disableVSS,
        #
        [Parameter(Mandatory=$False, HelpMessage='Enable or disable KeepBitLocker option for all partitions. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Nullable[boolean]]
        $KeepBitLocker,
        #
        [Parameter(Mandatory=$False, HelpMessage='Ignore bad sectors. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Nullable[boolean]]
        $ignoreBadSectors,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use system VSS provider. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Nullable[boolean]]
        $useSystemVSS,
        #
        [Parameter(Mandatory=$False, HelpMessage="Prefetch block count (0 - 100, 0 without prefetch)", ParameterSetName='ImageBased')]
        [Int32][ValidateRange(0,100)]
        $prefetchBlockCount,
        #
        [Parameter(Mandatory=$False, HelpMessage="Block size. Possible values: 128, 256, 512, 1024", ParameterSetName='ImageBased')]
        [ValidateSet("128", "256", "512", "1024")]
        [string]
        $blockSize,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude files/folders from Image-Based backup plan", ParameterSetName='ImageBased')]
        [string[]]
        $ExcludeItem,
        #
        [Parameter(Mandatory=$False, HelpMessage="Disable the 'Exclude files/folders' option in Image-Based backup plan", ParameterSetName='ImageBased')]
        [switch]
        $DisableExcludeFilesFolders,
        #
        [Parameter(Mandatory=$False, HelpMessage="Enable KeepBitLocker option for volumes with specified ids", ParameterSetName='ImageBased')]
        [string[]]
        $KeepBitLockerEnableForVolume,
        #
        [Parameter(Mandatory=$False, HelpMessage="Disable KeepBitLocker option for volumes with specified ids", ParameterSetName='ImageBased')]
        [string[]]
        $KeepBitLockerDisableForVolume
    )

    
    
    begin {
        if (-not($CBB = Get-MBSAgent)) {
            Break
        }
        if (-not($CBB.CBBProgramData)) {
            Write-Error "ERROR: ""enginesettings.list"" not found"
            Break
        }
        $CBBVersion = [version]$CBB.version
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
        function Set-Arguments {
            if ($StorageAccountID){$Argument += " -aid $StorageAccountID"}
            if ($NewName){$Argument += " -nn ""$NewName"""}
            if ($null -ne $SyncBeforeRun){
                if ($SyncBeforeRun) {
                    $Argument += " -sync yes"
                }else{
                    $Argument += " -sync no"
                }
            }
            if(-Not ($Global:MSP360ModuleSettings.SkipCompression)) {
                if ($null -ne $Compression){
                    if ($Compression) {
                        $Argument += " -c yes"
                    }else{
                        $Argument += " -c no"
                    }
                }
            } else {
                Write-Warning "MSP360ModuleSettings.SkipCompression is set. Ignoring Compression option"
            }
            if ($DisableEncryption){$Argument += " -ed"}
            if ($DisableSchedule){$Argument += " -sd"}
            if(-Not ($Global:MSP360ModuleSettings.SkipSSE)) {
                if ($null -ne $ServerSideEncryption){
                    if ($ServerSideEncryption) {
                        $Argument += " -sse yes"
                    }else{
                        $Argument += " -sse no"
                    }
                }
            } else {
                Write-Warning "MSP360ModuleSettings.SkipSSE is set. Ignoring ServerSideEncryption option"
            }
            if(-Not ($Global:MSP360ModuleSettings.SkipEncryption)) {
                if ($EncryptionAlgorithm){$Argument += " -ea $EncryptionAlgorithm"}
                if ($EncryptionPassword){$Argument += " -ep """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($EncryptionPassword)))+""""}
            } else {
                Write-Warning "MSP360ModuleSettings.SkipEncryption is set. Ignoring EncryptionPassword and EncryptionAlgorithm options"
            }
            if(-Not ($Global:MSP360ModuleSettings.SkipStorageClass)) {
                if ($StorageClass){$Argument += " -sc $StorageClass"}
            } else {
                Write-Warning "MSP360ModuleSettings.SkipStorageClass is set. Ignoring StorageClass option"
            }
            if ($null -ne $SaveBPConfiguration){
                if ($SaveBPConfiguration) {
                    $Argument += " -sp yes"
                }else{
                    $Argument += " -sp no"
                }
            }
            if ($RecurringType){$Argument += " -every $RecurringType"}
            if ($At){$Argument += " -at $At"}
            if ($DayOfMonth){$Argument += " -day $DayOfMonth"}
            if ($Weekday){$Argument += " -weekday "+($Weekday -join ",")}
            if ($Weeknumber){$Argument += " -weeknumber $Weeknumber"}
            if ($DailyFrom){$Argument += " -dailyFrom $DailyFrom"}
            if ($DailyTill){$Argument += " -dailyTill $DailyTill"}
            if ($Occurs){$Argument += " -occurs $Occurs"}
            if ($OccurValue){$Argument += " -occurValue $OccurValue"}
            if ($RepeatEvery){$Argument += " -repeatEvery $RepeatEvery"}
            if ($repeatStartDate){$Argument += " -repeatStartDate $repeatStartDate"}
            if ($stopAfter){$Argument += " -stopAfter $stopAfter"}
            
            if ($null -ne $preActionEnabled) {
                if ($CBBVersion -ge [version]"6.3.8") {
                    if ($preActionEnabled) {
                        $Argument += " -prae yes"
                    } else {
                        $Argument += " -prae no"
                    }
                } else {
                    Write-Warning "Backup agent version is $CBBVersion. ""preActionEnabled"" parameter requires version 6.3.8 or higher. Ignoring preActionEnabled option"
                }
            }
            if ($preActionCommand){
                $Argument += " -preAction ""$preActionCommand"""
                if (($CBBVersion -ge [version]"6.3.8") -And ($null -eq $preActionEnabled)) {
                    Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): -preActionCommand specified but -preActionEnabled is not set. Enabling pre action"
                    $Argument += " -prae yes"
                }
            }
            if ($null -ne $preActionContinueAnyway){
                if ($preActionContinueAnyway) {
                    $Argument += " -pac yes"
                }else{
                    $Argument += " -pac no"
                }
            }

            if ($null -ne $postActionEnabled) {
                if ($CBBVersion -ge [version]"6.3.8") {
                    if ($postActionEnabled) {
                        $Argument += " -ppae yes"
                    } else {
                        $Argument += " -ppae no"
                    }
                } else {
                    Write-Warning "Backup agent version is $CBBVersion. ""postActionEnabled"" parameter requires version 6.3.8 or higher. Ignoring postActionEnabled option"
                }
            }
            if ($postActionCommand){
                $Argument += " -postAction ""$postActionCommand"""
                if (($CBBVersion -ge [version]"6.3.8") -And ($null -eq $postActionEnabled)) {
                    Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): -postActionCommand specified but -postActionEnabled is not set. Enabling post action"
                    $Argument += " -ppae yes"
                }
            }
            if ($null -ne $postActionRunAnyway){
                if ($postActionRunAnyway) {
                    $Argument += " -paa yes"
                }else{
                    $Argument += " -paa no"
                }
            }

            # Need a fix in backup agent CLI for this option to work
            #if ($DisableBackupChain) {
            #    if ($CBBVersion -ge [version]"7.2.1.0") {
            #        $Argument += " -chanPlanOff"
            #    }else{
            #        Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Backup agent version is $CBBVersion. Using CBB import method for ""DisableBackupChain"" option"
            #    }
            #}

            $BackupChainPlanIDIsPresent = $false
            if ($BackupChainPlanID) {
                if ($CBBVersion -ge [version]"7.2.1.0") {
                    $Argument += " -chainPlanOn $BackupChainPlanID"
                    $BackupChainPlanIDIsPresent = $true
                }else{
                    Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Backup agent version is $CBBVersion. Using CBB import method for ""BackupChainPlanID"" option"
                }
            } elseif (($BackupPlan.ExecuteNextPlan) -And (-Not ($DisableBackupChain))) {
                if ($CBBVersion -ge [version]"7.2.1.0") {
                    $BackupChainPlanIDFromPlan = $BackupPlan.NextExectutionPlan
                    $BackupChainPlanIDIsPresent = $true
                    # Need a fix in backup agent CLI to avoid always re-enabling backup chain
                    #if (($null -ne $BackupChainExecuteOnlyAfterSuccess) -Or ($null -ne $BackupChainExecuteForceFull)) {
                        $Argument += " -chainPlanOn $BackupChainPlanIDFromPlan"
                    #}
                }
            }

            if (($null -ne $BackupChainExecuteOnlyAfterSuccess) -And (-Not ($DisableBackupChain))) {
                if ($CBBVersion -ge [version]"7.2.1.0") {
                    if ($BackupChainPlanIDIsPresent) {
                        if ($BackupChainPlanIDFromPlan) {
                            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): ""BackupChainPlanID"" parameter not specified with ""BackupChainExecuteOnlyAfterSuccess"" option. Existing plan ID ($BackupChainPlanIDFromPlan) will be used"
                        }
                        if ($BackupChainExecuteOnlyAfterSuccess) {
                            $Argument += " -chainPlanAfterSuccess yes"
                        }else{
                            $Argument += " -chainPlanAfterSuccess no"
                        }
                    }else{
                        Write-Warning """BackupChainPlanID"" parameter not specified and backup chain is not enabled in the current plan. Ignoring ""BackupChainExecuteOnlyAfterSuccess"" option"
                    }
                }else{
                    Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Backup agent version is $CBBVersion. Using CBB import method for ""BackupChainExecuteOnlyAfterSuccess"" option"
                }
            }
            if (($null -ne $BackupChainExecuteForceFull) -And (-Not ($DisableBackupChain))) {
                if ($CBBVersion -ge [version]"7.2.1.0") {
                    if ($BackupChainPlanIDIsPresent) {
                        if ($BackupChainPlanIDFromPlan) {
                            Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): ""BackupChainPlanID"" parameter not specified with ""BackupChainExecuteForceFull"" option. Existing plan ID ($BackupChainPlanIDFromPlan) will be used"
                        }
                        if ($BackupChainExecuteForceFull) {
                            $Argument += " -chainPlanForceFull yes"
                        }else{
                            $Argument += " -chainPlanForceFull no"
                        }
                    }else{
                        Write-Warning """BackupChainPlanID"" parameter not specified and backup chain is not enabled in the current plan. Ignoring ""BackupChainExecuteForceFull"" option"
                    }
                }else{
                    Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Backup agent version is $CBBVersion. Using CBB import method for ""BackupChainExecuteForceFull"" option"
                }
            }

            if ($notification){$Argument += " -notification $notification"}
            if ($winLog){$Argument += " -winLog $winLog"}
            if ($KeepVersionPeriod){$Argument += " -purge $KeepVersionPeriod"}
            if ($KeepNumberOfVersions){$Argument += " -keep $KeepNumberOfVersions"}
            if ($null -ne $keepLastVersion){
                if ($keepLastVersion) {
                    $Argument += " -keepLastVersion yes"
                }else{
                    $Argument += " -keepLastVersion no"
                }
            }
            if ($delayPurge){$Argument += " -delayPurge $delayPurge"}
            if ($null -ne $runMissed){
                if ($runMissed) {
                    $Argument += " -runMissed yes"
                }else{
                    $Argument += " -runMissed no"
                }
            }
            if ($RecurringTypeForceFull){$Argument += " -everyForceFull $RecurringTypeForceFull"}
            if ($atForceFull){$Argument += " -atForceFull $atForceFull"}
            if ($DayOfMonthForceFull){$Argument += " -dayForceFull $DayOfMonthForceFull"}
            if ($weekdayForceFull){$Argument += " -weekdayForceFull $weekdayForceFull"}
            if ($weeknumberForceFull){$Argument += " -weeknumberForceFull $weeknumberForceFull"}
            if ($dailyFromForceFull){$Argument += " -dailyFromForceFull $dailyFromForceFull"}
            if ($dailyTillForceFull){$Argument += " -dailyTillForceFull $dailyTillForceFull"}
            if ($occursForceFull){$Argument += " -occursForceFull $occursForceFull"}
            if ($occurValueForceFull){$Argument += " -occurValueForceFull $occurValueForceFull"}
            if ($repeatEveryForceFull){$Argument += " -repeatEveryForceFull $repeatEveryForceFull"}
            if ($repeatStartDateForceFull){$Argument += " -repeatStartDateForceFull $repeatStartDateForceFull"}
            if ($rebackupDate){$Argument += " -rebackupDate $rebackupDate"}
            if ($DisableForceFullSchedule){$Argument += " -sdForce"}

            if ($null -ne $SyntheticFull){
                if ($SyntheticFull) {
                    $Argument += " -syntheticFull yes"
                }else{
                    $Argument += " -syntheticFull no"
                }
            }

            if ($null -ne $useBlockLevelBackup){
                if ($useBlockLevelBackup) {
                    $Argument += " -useBlockLevelBackup yes"
                }else{
                    $Argument += " -useBlockLevelBackup no"
                }
            }

            # --------- File-Level ------------
            if ($null -ne $UseFastNTFSScan){
                if ($CBBVersion -ge [version]"7.1.0.0") {
                    if ($UseFastNTFSScan) {
                        $Argument += " -fastNtfs yes"
                    }else{
                        $Argument += " -fastNtfs no"
                    }
                } else {
                    Write-Warning "Backup agent version is $CBBVersion. ""UseFastNTFSScan"" parameter requires version 7.1.0 or higher. Ignoring UseFastNTFSScan option"
                }
            }
            if ($null -ne $BackupNTFSPermissions){
                if ($BackupNTFSPermissions) {
                    $Argument += " -ntfs yes"
                }else{
                    $Argument += " -ntfs no"
                }
            }
            if(-Not ($Global:MSP360ModuleSettings.SkipVSS)) {
                if ($null -ne $ForceUsingVSS){
                    if ($ForceUsingVSS) {
                        $Argument += " -vss yes"
                    }else{
                        if ($UseFastNTFSScan) {
                            Write-Warning "Cannot disable ForceUsingVSS because UseFastNTFSScan is enabled"
                        } else {
                            $Argument += " -vss no"
                        }
                    }
                }
            } else {
                Write-Warning "MSP360ModuleSettings.SkipVSS is set. Ignoring ForceUsingVSS option"
            }
            if ($null -ne $UseShareReadWriteModeOnError){
                if ($UseShareReadWriteModeOnError) {
                    $Argument += " -sharerw yes"
                }else{
                    $Argument += " -sharerw no"
                }
            }
            if ($DeleteLocallyDeletedFilesAfter){$Argument += " -df $DeleteLocallyDeletedFilesAfter"}
            if ($null -ne $BackupEmptyFolders){
                if ($BackupEmptyFolders) {
                    $Argument += " -bef yes"
                }else{
                    $Argument += " -bef no"
                }
            }
            if ($BackupOnlyAfter){$Argument += " -oa $BackupOnlyAfter"}
            if ($null -ne $ExcludeSystemHiddenFiles){
                if ($ExcludeSystemHiddenFiles) {
                    $Argument += " -es yes"
                }else{
                    $Argument += " -es no"
                }
            }
            if ($SkipFolders){$Argument += " -skipf "+'"{0}"' -f ($SkipFolders -join ';' -replace ',',';')}
            if ($IncludeFilesMask){$Argument += " -ifm "+'"{0}"' -f ($IncludeFilesMask -join ';' -replace ',',';')}
            if ($ExcludeFilesMask){$Argument += " -efm "+'"{0}"' -f ($ExcludeFilesMask -join ';' -replace ',',';')}
            if ($null -ne $IgnoreErrorPathNotFound){
                if ($IgnoreErrorPathNotFound) {
                    $Argument += " -iepnf yes"
                }else{
                    $Argument += " -iepnf no"
                }
            }
            if ($null -ne $TrackDeletedFiles){
                if ($TrackDeletedFiles) {
                    $Argument += " -trackdeleted yes"
                }else{
                    $Argument += " -trackdeleted no"
                }
            }
            if ($AddNewFile){$Argument += " -af "+'"{0}"' -f ($AddNewFile -join '" -af "')}
            if ($AddNewDirectory){$Argument += " -ad "+'"{0}"' -f ($AddNewDirectory -join '" -ad "')}
            if ($ExcludeFile){$Argument += " -rf "+'"{0}"' -f ($ExcludeFile -join '" -rf "')}
            if ($ExcludeDirectory){$Argument += " -rd "+'"{0}"' -f ($ExcludeDirectory -join '" -rd "')}
            if ($BackupFile){$Argument += " -f "+'"{0}"' -f ($BackupFile -join '" -f "')}
            if ($BackupDirectory){$Argument += " -d "+'"{0}"' -f ($BackupDirectory -join '" -d "')}
            if ($null -ne $GenerateDetailedReport){
                if ($GenerateDetailedReport) {
                    $Argument += " -dr yes"
                }else{
                    $Argument += " -dr no"
                }
            }

            # ------------- Image-Based -------------

            switch ($BackupVolumes) {
                'AllVolumes' {$Argument += " -av"}
                'SystemRequired' {$Argument += " -r"}
                'SelectedVolumes' {
                    ForEach-Object -InputObject $Volumes -Process {
                        Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): Arguments: $Argument"
                        $Argument += " -v $_"
                        Write-Verbose -Message "$($PSCmdlet.MyInvocation.MyCommand.Name): Arguments: $Argument"
                    }
                }
                Default {}
            }

            if ($null -ne $disableVSS){
                if ($disableVSS) {
                    $Argument += " -disableVSS yes"
                }else{
                    $Argument += " -disableVSS no"
                }
            }
            if ($null -ne $ignoreBadSectors){
                if ($ignoreBadSectors) {
                    $Argument += " -ignoreBadSectors yes"
                }else{
                    $Argument += " -ignoreBadSectors no"
                }
            }
            if ($null -ne $useSystemVSS){
                if ($useSystemVSS) {
                    $Argument += " -useSystemVSS yes"
                }else{
                    $Argument += " -useSystemVSS no"
                }
            }
            if ($prefetchBlockCount){$Argument += " -prefetchBlockCount $prefetchBlockCount"}
            if ($blockSize){$Argument += " -blockSize $blockSize"}
            if ($ExcludeItem) {
                if ($CBBVersion -ge [version]"7.8.2") {
                    $Argument += " -skipf "+'"{0}"' -f ($ExcludeItem -join '" -skipf "')
                }else{
                    Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Backup agent version is $CBBVersion. Using CBB import method for ""ExcludeItem"" option"
                }
            }
            if ($DisableExcludeFilesFolders){
                if ($CBBVersion -ge [version]"7.8.2") {
                    $Argument += " -skipfoff"
                }else{
                    Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Backup agent version is $CBBVersion. Using CBB import method for ""DisableExcludeFilesFolders"" option"
                }
            }
            if ($null -ne $KeepBitLocker) {
                if ($CBBVersion -ge [version]"7.2.2.0") {
                    if ($KeepBitLocker) {
                        $Argument += " -keepBitlocker yes"
                    }else{
                        $Argument += " -keepBitlocker no"
                    }
                }else{
                    Write-Verbose "$($PSCmdlet.MyInvocation.MyCommand.Name): Backup agent version is $CBBVersion. Using CBB import method for ""KeepBitLocker"" option"
                }
            }
            if ($KeepBitLockerEnableForVolume) {
                if ($CBBVersion -ge [version]"7.2.2.0") {
                    if ($null -eq $KeepBitLocker) {
                        $Argument += " -keepBitlockerOn "+'"{0}"' -f ($KeepBitLockerEnableForVolume -join '" -keepBitlockerOn "')
                    } else {
                        Write-Warning """KeepBitLocker"" and ""KeepBitLockerEnableForVolume"" parameters are mutually exclusive. Ignoring KeepBitLockerEnableForVolume option"
                    }
                }else{
                    Write-Warning "Backup agent version is $CBBVersion. ""KeepBitLockerEnableForVolume"" parameter requires version 7.2.2 or higher. Ignoring KeepBitLockerEnableForVolume option"
                }
            }
            if ($KeepBitLockerDisableForVolume) {
                if ($CBBVersion -ge [version]"7.2.2.0") {
                    if ($null -eq $KeepBitLocker) {
                        $Argument += " -keepBitlockerOff "+'"{0}"' -f ($KeepBitLockerDisableForVolume -join '" -keepBitlockerOff "')
                    } else {
                        Write-Warning """KeepBitLocker"" and ""KeepBitLockerDisableForVolume"" parameters are mutually exclusive. Ignoring KeepBitLockerDisableForVolume option"
                    }
                }else{
                    Write-Warning "Backup agent version is $CBBVersion. ""KeepBitLockerDisableForVolume"" parameter requires version 7.2.2 or higher. Ignoring KeepBitLockerDisableForVolume option"
                }
            }
            
            Return $Argument
        }

        if ($_){
            $BackupPlan = $_
        }else{
            if($ID){
                $BackupPlan = Get-MBSBackupPlan | Where-Object {$_.ID -eq $ID}
            }else{
                $BackupPlan = Get-MBSBackupPlan | Where-Object {$_.Name -eq $Name}
            }
        }

        if($_ -ne $null){
            if($_.Type -eq "Plan" -and $FileLevelParameterSet){
                $Arguments = " editBackupPlan"
            }elseif ($_.Type -eq "BackupDiskImagePlan" -and $ImageBasedParameterSet) {
                $Arguments = " editBackupIBBPlan"
            }elseif ($CommonParameterSet) {
                switch ($_.Type) {
                    'Plan' {$Arguments = " editBackupPlan"}
                    'BackupDiskImagePlan' {$Arguments = " editBackupIBBPlan"}
                    Default {
                        Write-host "$_ type is not supported by the Cmdlet" -ForegroundColor Red
                        return 
                    }
                }
            }else{
                Write-host "Backup plan """($_.Name)""" is skipped" -ForegroundColor Red 
                return 
            }
        }else{
            if ($FileLevelParameterSet) {
                $Arguments = " editBackupPlan"
            }elseif ($ImageBasedParameterSet) {
                $Arguments = " editBackupIBBPlan"
            }elseif ($CommonParameterSet) {
                switch ($BackupPlan.Type) {
                    'Plan' {$Arguments = " editBackupPlan"}
                    'BackupDiskImagePlan' {$Arguments = " editBackupIBBPlan"}
                    Default {
                        Write-host "$($BackupPlan.Type) type is not supported by the Cmdlet" -ForegroundColor Red
                        return 
                    }
                }
            }
        }
            
        if ($ID){
            $Arguments += " -id $ID"
        }else{
            $Arguments += " -n ""$Name"""
        }
        $Arguments += Set-Arguments
        if($Arguments -notmatch '^( editBackupPlan| editBackupIBBPlan) (-id [0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}|-n "[^"]*")$'){
            (Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword).result
        }

        if ($SpecialFunction) {
            switch ($SpecialFunction) {
                "ExcludeEncryptedFiles" {
                    if ($BackupPlan.Type -eq "Plan") {
                        Write-Host "Searching for encrypted files in plan:" $BackupPlan.Name -ForegroundColor Green
                        $Arguments = "editBackupPlan -id "+$ID
                        $FoundFlag = $false
                        foreach ($Item in $BackupPlan.Items)
                        {
                            
                            foreach ($File in (get-childitem ($Item) -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {$_.Attributes -ge "Encrypted"}))
                            {
                                Write-Host "File "$File.FullName "is encrypted and added to exclusion list"
                                $Arguments += " -rf """+$File.FullName+""""
                                $FoundFlag = $True
                            }
                            
                        }
                        if ($FoundFlag) {
                            (Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword).result
                        }
                    }else{
                        Write-Host "ExcludeEncryptedFiles option supports only File-Level backup plans."
                    }
                }
                "ExcludeTempWindowsAppsFolders" {
                    if ($BackupPlan.Type -eq "Plan") {
                        $Exclusions = '%USERPROFILE%\AppData\Local\Microsoft\WindowsApps', '%USERPROFILE%\AppData\Local\Packages', '%USERPROFILE%\AppData\Local\Temp'
                        $BackupPlanXml = [xml](Get-Content ($CBB.CBBProgramData+"\"+$BackupPlan.ID+".cbb"))
                        Write-Host "Adding exclusions to plan:" $BackupPlan.Name -ForegroundColor Green
                        foreach($exclusion in $Exclusions){
                            $element = ((($BackupPlanXml.BasePlan.SelectSingleNode("//ExcludedItems")).AppendChild($BackupPlanXml.CreateElement("PlanItem"))).AppendChild($BackupPlanXml.CreateElement("Path"))).AppendChild($BackupPlanXml.CreateTextNode($exclusion))
                        }
                        Import-Configuration -BackupPlanXml $BackupPlanXml -MasterPassword $MasterPassword
                    }else{
                        Write-Host "ExcludeTempWindowsAppsFolders option supports only File-Level backup plans."
                    }
                }
                "ExcludeOneDriveFolders" {
                    if ($BackupPlan.Type -eq "Plan") {
                        $UserProf = Get-ChildItem -Path Registry::HKEY_USERS -ErrorAction SilentlyContinue | Select-Object Name
                        $OneDrivePathArray = @()
                        $OneDriveRegKeys = @("\Software\Microsoft\OneDrive\Accounts\Business1\ScopeIdToMountPointPathCache","\Software\Microsoft\OneDrive\Accounts\Personal\ScopeIdToMountPointPathCache")
                        $UserProf  | ForEach-Object {
                            foreach ($OneDriveRegKey in $OneDriveRegKeys) {
                                if (Test-Path -Path ("Registry::"+$_.Name+$OneDriveRegKey)){
                                    $UserProfile = $_.Name
                                    $OneDriveFolder = Get-Item -Path  ("Registry::"+$UserProfile+$OneDriveRegKey)| Select-Object -ExpandProperty Property 
                                    $OneDriveFolder | Foreach-Object {$OneDrivePathArray +=(Get-ItemProperty -Path ("Registry::"+$UserProfile+$OneDriveRegKey) -Name $_)."$_"}
                                }
                            }
                        }
                        
                        $BackupPlanXml = [xml](Get-Content ($CBB.CBBProgramData+"\"+$BackupPlan.ID+".cbb"))
                        Write-Host "Adding exclusions to plan:" $BackupPlan.Name -ForegroundColor Green
                        foreach($exclusion in $OneDrivePathArray){
                            $element = ((($BackupPlanXml.BasePlan.SelectSingleNode("//ExcludedItems")).AppendChild($BackupPlanXml.CreateElement("PlanItem"))).AppendChild($BackupPlanXml.CreateElement("Path"))).AppendChild($BackupPlanXml.CreateTextNode($exclusion))
                        }
                        Import-Configuration -BackupPlanXml $BackupPlanXml -MasterPassword $MasterPassword
                    }else{
                        Write-Host "ExcludeOneDriveFolders option supports only File-Level backup plans."
                    }
                }
                "AddFixedDrivesToIBB" {
                    if ($BackupPlan.Type -eq "BackupDiskImagePlan") {
                        $BackupPlanXml = [xml](Get-Content ($CBB.CBBProgramData+"\"+$BackupPlan.ID+".cbb"))
                        $BackupPlanXml.BasePlan.BackupVolumes = "SelectedOnly"
                        $BackupPlanXml.BasePlan.DiskInfo.DiskInfoCommunication | ForEach-Object {
                            if ($_.DriveType -eq "Fixed"){
                                $_.Enabled = "true"
                                $_.Volumes.VolumeInfoCommunication | ForEach-Object { $_.Enabled = "true"}
                            }
                        }
                        $BackupPlanXml.BasePlan.DiskInfo.DiskInfoCommunication | ForEach-Object {
                            if ($_.DriveType -eq "Removable"){
                                $_.Enabled = "false"
                                $_.Volumes.VolumeInfoCommunication | ForEach-Object { $_.Enabled = "false"}
                            }
                        }
                        Import-Configuration -BackupPlanXml $BackupPlanXml -MasterPassword $MasterPassword
                    }else{
                        Write-Host "AddFixedDrivesToIBB option supports only Image-Based backup plans."
                    }
                }
                "AddFixedDrivesToFileLevel" {
                    if ($BackupPlan.Type -eq "Plan") {
                        Get-WmiObject Win32_LogicalDisk | ForEach-Object {$BackupPlan | Edit-MBSBackupPlan -FileLevelParameterSet -ExcludeDirectory ($_.DeviceID+'\')}
                        Get-WmiObject Win32_LogicalDisk | Where-Object {($_.DriveType -eq 3) -and ($_.VolumeName -notlike 'Google Drive*')} | ForEach-Object {
                                $BackupPlan | Edit-MBSBackupPlan  -FileLevelParameterSet -AddNewFolder ($_.DeviceID+'\')
                        }
                    }else{
                        Write-Host "AddFixedDrivesToFileLevel option supports only File-Level backup plans."
                    }
                }
                "DisablePreAction" {
                    if ($CBBVersion -ge [version]"6.3.8") {
                        Write-Host "Backup agent version is $($CBBVersion). Parameter ""-preActionEnabled `$false"" can be used to disable pre action."
                    }
                    $BackupPlanXml = [xml](Get-Content ($CBB.CBBProgramData+"\"+$BackupPlan.ID+".cbb"))
                    $BackupPlanXml.BasePlan.Actions.Pre.Enabled = "false"
                    $BackupPlanXml.BasePlan.Actions.Pre.CommandLine = ""
                    $BackupPlanXml.BasePlan.Actions.Pre.Arguments = ""
                    Import-Configuration -BackupPlanXml $BackupPlanXml -MasterPassword $MasterPassword
                }
                Default {}
            }
        }

        if ((($BackupChainPlanID) -or ($null -ne $BackupChainExecuteOnlyAfterSuccess) -or ($null -ne $BackupChainExecuteForceFull)) -And ($CBBVersion -lt [version]"7.2.1.0")){
            $BackupPlanXml = [xml](Get-Content ($CBB.CBBProgramData+"\"+$BackupPlan.ID+".cbb"))
            #if($DisableBackupChain){
            #    $BackupPlanXml.BasePlan.ExecuteNextPlan = "false"
            #}else{
                if ($BackupChainPlanID) {
                    $null = $BackupPlanXml.BasePlan.RemoveChild($BackupPlanXml.BasePlan.selectSingleNode("//NextExectutionPlan"))
                    $null = ($BackupPlanXml.selectSingleNode("//BasePlan")).AppendChild($BackupPlanXml.CreateElement("NextExectutionPlan")).AppendChild($BackupPlanXml.CreateTextNode("$BackupChainPlanID"))
                    $BackupPlanXml.BasePlan.ExecuteNextPlan = "true"
                }
                if ($null -ne $BackupChainExecuteOnlyAfterSuccess) {
                    $BackupPlanXml.BasePlan.ExecuteNextPlanOnlyIfSucces = $BackupChainExecuteOnlyAfterSuccess.ToString().ToLower()
                }
                if ($null -ne $BackupChainExecuteForceFull) {
                    $BackupPlanXml.BasePlan.ForceFullNextPlan = $BackupChainExecuteForceFull.ToString().ToLower()
                }
            #}
            $Null = Import-Configuration -BackupPlanXml $BackupPlanXml -MasterPassword $MasterPassword
        }
        if ($DisableBackupChain) {
            $BackupPlanXml = [xml](Get-Content ($CBB.CBBProgramData+"\"+$BackupPlan.ID+".cbb"))
            $BackupPlanXml.BasePlan.ExecuteNextPlan = "false"
            $Null = Import-Configuration -BackupPlanXml $BackupPlanXml -MasterPassword $MasterPassword
        }
        if (($ExcludeItem) -and ($CBBVersion -lt [version]"7.8.2")){
            $BackupPlanXml = [xml](Get-Content ($CBB.CBBProgramData+"\"+$BackupPlan.ID+".cbb"))
            foreach ($ExcludePath in $ExcludeItem) {
                $BackupPlanXml.BasePlan.DiskInfo.DiskInfoCommunication.Volumes.VolumeInfoCommunication | Where-Object {$_.MountPoints.string -eq $ExcludePath.Substring(0,3)} | ForEach-Object -Process {
                    if (-not ($_.BackupOptions.ExcludeRules.FileExcludeRule | Where-Object Folder -eq $ExcludePath.Remove(0,2))){
                        $element = ($_.BackupOptions.SelectSingleNode(".//ExcludeRules")).AppendChild($BackupPlanXml.CreateElement("FileExcludeRule"))
                        $null = $element.AppendChild($BackupPlanXml.CreateElement("Folder")).AppendChild($BackupPlanXml.CreateTextNode($ExcludePath.Remove(0,2)))
                        $null = $element.AppendChild($BackupPlanXml.CreateElement("Mask")).AppendChild($BackupPlanXml.CreateTextNode("*"))
                        $null = $element.AppendChild($BackupPlanXml.CreateElement("Recursive")).AppendChild($BackupPlanXml.CreateTextNode("true"))
                        $null = $element.AppendChild($BackupPlanXml.CreateElement("DeleteFolder")).AppendChild($BackupPlanXml.CreateTextNode("true"))
                    }
                }
            }
            $BackupPlanXml.BasePlan.ExcludeEnabled = "true"
            Import-Configuration -BackupPlanXml $BackupPlanXml -MasterPassword $MasterPassword
        }elseif (($DisableExcludeFilesFolders) -and ($CBBVersion -lt [version]"7.8.2")){
            $BackupPlanXml = [xml](Get-Content ($CBB.CBBProgramData+"\"+$BackupPlan.ID+".cbb"))
            $BackupPlanXml.SelectNodes("BasePlan/DiskInfo/DiskInfoCommunication/Volumes/VolumeInfoCommunication/BackupOptions/ExcludeRules") | ForEach-Object {
                #$_.RemoveAll()
                $_.IsEmpty = $true
            }
            $BackupPlanXml.BasePlan.ExcludeEnabled = "false"
            Import-Configuration -BackupPlanXml $BackupPlanXml -MasterPassword $MasterPassword
        }
        if (($null -ne $KeepBitLocker) -and ($CBBVersion -lt [version]"7.2.2.0")){
            $BackupPlanXml = [xml](Get-Content ($CBB.CBBProgramData+"\"+$BackupPlan.ID+".cbb"))
            $BackupPlanXml.BasePlan.DiskInfo.DiskInfoCommunication.Volumes.VolumeInfoCommunication | ForEach-Object -Process {
                $_.BackupOptions.KeepBitLocker = $KeepBitLocker.ToString().ToLower()
            }
            $Null = Import-Configuration -BackupPlanXml $BackupPlanXml -MasterPassword $MasterPassword
        }
    }
    
    end {
        
    }
}
# SIG # Begin signature block
