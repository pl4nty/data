function Edit-MBSNBFBackupPlan {
    <#
    .SYNOPSIS
        Edit NBF backup plans.
    .DESCRIPTION
        Edit new backup format (NBF) backup plans. File-Level and Image-Based backup plan types are supported.
    .PARAMETER FileLevel
        Switch parameter for modifying settings of file-level backup plans only
    .PARAMETER ImageBased
        Switch parameter for modifying settings of image-based backup plans only
    .PARAMETER All
        Switch parameter for modifying settings present in any backup plan type (e.g. encryption, compression, retention policy, schedule)
    .PARAMETER ID
        Backup plan ID
    .PARAMETER Name
        Backup plan name
    .PARAMETER StorageAccountID
        Account Name or Account ID. Use Get-MBSStorageAccount to list storages
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
    .PARAMETER FullConsistencyCheck
        Use full consistency check
    .PARAMETER MasterPassword
        Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)
    .PARAMETER runMissed
        Run missed scheduled backup immediately when computer starts up
    .PARAMETER RecurringType
        Specify schedule recurring type. Possible values: day, week, month, dayofmonth
    .PARAMETER At
        Specify datetime or time of schedule. Example -at ""06/09/19 7:43 AM"" , or -at ""7:43 AM"" for every day schedule
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
    .PARAMETER RepeatStartDate
        Specify start date of repetitions
    .PARAMETER stopAfter
        Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -stopAfter ""20:30"" or -stopAfter ""100:00"" etc.
    .PARAMETER ForeverForwardIncremental
        Enable Forever Forward Incremental backup. Possible values: $true/$false
    .PARAMETER preActionEnabled
        Enables the pre-action
    .PARAMETER preActionCommand
        Specify command to be executed before the backup plan runs
    .PARAMETER preActionContinueAnyway
        Specify to continue backup plan if pre-backup action fails. Possible values: $true/$false
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
        Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plan name').ID
    .PARAMETER BackupChainExecuteOnlyAfterSuccess
        Specify to execute the chained plan only if the current plan is completed successfully ($true) or always ($false)
    .PARAMETER BackupChainExecuteForceFull
        Specify to force full backup for the chained plan. Possible values: $true/$false
    .PARAMETER KeepVersionPeriod
        Keep backups for specified number of days. Set 0 to keep all versions or specify number of days. Example: -KeepVersionPeriod 90
    .PARAMETER GFSKeepWeekly
        Keep weekly full backups using GFS retention policy. Set 0 to disable or specify number of weeks. Example: -GFSKeepWeekly 4
    .PARAMETER GFSKeepMonthly
        Keep monthly full backups using GFS retention policy. Set 0 to disable or specify number of months. Example: -GFSKeepMonthly 12
    .PARAMETER GFSKeepYearly
        Keep yearly full backups using GFS retention policy. Set 0 to disable or specify number of years. Example: -GFSKeepYearly 5
    .PARAMETER GFSMonthOfTheYear
        Specify the month for the first successful full backup to be marked for GFS yearly retention. Example: -GFSMonthOfTheYear January
    .PARAMETER IntelligentRetention
        Enable Intelligent Retention for Forever Forward Incremental. Possible values: $true/$false. By default set to $true if Forever Forward Incremental is enabled
    .PARAMETER RecurringTypeForceFull
        Specify force full schedule recurring type. Possible values: day, week, month, dayofmonth
    .PARAMETER DayOfMonthForceFull
        Specify day for 'dayofmonth' force full schedule (1..31)
    .PARAMETER weekdayForceFull
        Specify day(s) of week for weekly force full schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly force full schedule
    .PARAMETER repeatEveryForceFull
        Specify force full repeat period value. Possible values: 1..31
    .PARAMETER repeatStartDateForceFull
        Specify force full start date of repetitions
    .PARAMETER DisableForceFullSchedule
        Specify to disable schedule of forced full backup
    .PARAMETER SyntheticFull
        Use Synthetic Full backup (this parameter is NOT supported for all storage providers). Possible values: $true/$false
    .PARAMETER UseFastNTFSScan
        The Fast NTFS scan speeds up backup processing by using a low-level API for accessing NTFS structures. This option is useful for NTFS volumes with a large number of files. Enabling this option automatically enables ForceUsingVSS option. Possible values: $true/$false
    .PARAMETER BackupNTFSPermissions
        Backup NTFS permissions. Possible values: $true/$false
    .PARAMETER ForceUsingVSS
        Force using VSS (Volume Shadow Copy Service). Cannot be disabled if UseFastNTFSScan is enabled. Possible values: $true/$false
    .PARAMETER KeepEFSEncryption
        Back up EFS files as encrypted. Possible values: $true/$false
    .PARAMETER UseShareReadWriteModeOnError
        Use share read/write mode on errors. Can help if file is open in share read/write mode. Possible values: $true/$false
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
        Type of volumes to backup. Possible values: AllVolumes, FixedVolumes, SystemRequired, SelectedVolumes
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
        Enable KeepBitLocker option for volumes with specified IDs
    .PARAMETER KeepBitLockerDisableForVolume
        Disable KeepBitLocker option for volumes with specified IDs
    .PARAMETER RestoreVerificationMode
        Run restore verification mode. Possible values: DoNotRun, RunForFull, RunForIncremental, RunForFullAndIncremental
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -PlanFormat NBF | Edit-MBSNBFBackupPlan -All -Compression $true
        Enable compression option for all new format backup plans.
    .EXAMPLE
        PS C:\> Edit-MBSNBFBackupPlan -FileLevel -Name 'Files' -ForeverForwardIncremental $true -KeepVersionPeriod 90 -RecurringType day -At 22:00
        Enable forever forward incremental backup for plan with name 'Files' and set it to run every day at 10:00 PM and keep all backups for 3 months.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -PlanType Image-Based -PlanFormat NBF | Edit-MBSNBFBackupPlan -ImageBased -ExcludeItem (Get-ChildItem -Path 'C:\Users' -Recurse | Where-Object {$_.PSIsContainer -eq $true -and $_.Name -match 'OneDrive'}).FullName
        Exclude all OneDrive folders in 'C:\Users' (recursively) in all new format image-based backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -StorageType Cloud -PlanType Image-Based -PlanFormat NBF | Edit-MBSNBFBackupPlan -ImageBased -BackupVolumes SystemRequired
        Add only system required volumes to cloud image-based backup plans.
    .EXAMPLE
        PS C:\> Get-MBSBackupPlan -PlanFormat NBF | Where {$_.Name -like 'Share*'} | Edit-MBSNBFBackupPlan -All -StorageAccountID (Get-MBSStorageAccount | Where {$_.DisplayName -like 'Wasabi'}).ID
        Change storage account to Wasabi in all NBF backup plans which names start with 'Share'
    .INPUTS
        System.Management.Automation.PSCustomObject
    .OUTPUTS
        System.Management.Automation.PSCustomObject
    .NOTES
        Author: MSP360 Onboarding Team
    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/edit-mbsnbfbackupplan
    #>

    [CmdletBinding(DefaultParameterSetName='Common')]
    param (
        #
        [Parameter(Mandatory=$True, HelpMessage="Switch parameter for modifying settings of file-level backup plans only", ParameterSetName='FileLevel')]
        [switch]
        $FileLevel,
        #
        [Parameter(Mandatory=$True, HelpMessage="Switch parameter for modifying settings of image-based backup plans only", ParameterSetName='ImageBased')]
        [switch]
        $ImageBased,
        #
        [Parameter(Mandatory=$True, HelpMessage="Switch parameter for modifying settings present in any backup plan type (e.g. encryption, compression, retention policy, schedule)", ParameterSetName='Common')]
        [switch]
        $All,
        #
        [Parameter(ValueFromPipelineByPropertyName, HelpMessage="Backup plan ID")]
        [string]
        $ID,
        #
        [Parameter(ValueFromPipelineByPropertyName, HelpMessage="Backup plan name")]
        [string]
        $Name,
        #
        [Parameter(Mandatory=$False, HelpMessage="Account Name or Account ID. Use Get-MBSStorageAccount to list storages", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Account Name or Account ID. Use Get-MBSStorageAccount to list storages", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Account Name or Account ID. Use Get-MBSStorageAccount to list storages", ParameterSetName='FileLevel')]
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
        [Parameter(Mandatory=$False, HelpMessage="Use full consistency check", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Use full consistency check", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Use full consistency check", ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $FullConsistencyCheck,
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
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule recurring type. Possible values: day, week, month, dayofmonth", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule recurring type. Possible values: day, week, month, dayofmonth", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule recurring type. Possible values: day, week, month, dayofmonth", ParameterSetName='FileLevel')]
        [ValidateSet("day", "week", "month", "dayofmonth")]
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
        $RepeatStartDate,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -stopAfter ""20:30"" or -stopAfter ""100:00"" etc.", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -stopAfter ""20:30"" or -stopAfter ""100:00"" etc.", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify time in HH:MM to stop the plan if it runs for HH hours MM minutes. Example -stopAfter ""20:30"" or -stopAfter ""100:00"" etc.", ParameterSetName='FileLevel')]
        [string]
        $stopAfter,
        #
        [Parameter(Mandatory=$False, HelpMessage='Enable Forever Forward Incremental backup. Possible values: $true/$false', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Enable Forever Forward Incremental backup. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Enable Forever Forward Incremental backup. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $ForeverForwardIncremental,
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
        [Parameter(Mandatory=$False, HelpMessage='Specify to continue backup plan if pre-backup action fails. Possible values: $true/$false', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to continue backup plan if pre-backup action fails. Possible values: $true/$false', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to continue backup plan if pre-backup action fails. Possible values: $true/$false', ParameterSetName='FileLevel')]
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
        [Parameter(Mandatory=$False, HelpMessage="Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plan name').ID", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plan name').ID", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify chained plan ID. Use (Get-MBSBackupPlan | Where-Object Name -eq 'Backup plans name').ID or (Get-MBSRestorePlan | Where-Object Name -eq 'Backup plan name').ID", ParameterSetName='FileLevel')]
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
        [Parameter(Mandatory=$False, HelpMessage="Keep backups for specified number of days. Set 0 to keep all versions or specify number of days. Example: -KeepVersionPeriod 90", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Keep backups for specified number of days. Set 0 to keep all versions or specify number of days. Example: -KeepVersionPeriod 90", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Keep backups for specified number of days. Set 0 to keep all versions or specify number of days. Example: -KeepVersionPeriod 90", ParameterSetName='FileLevel')]
        [Alias("purge")]
        [Nullable[int]]
        $KeepVersionPeriod,
        #
        [Parameter(Mandatory=$False, HelpMessage="Keep weekly full backups using GFS retention policy. Set 0 to disable or specify number of weeks. Example: -GFSKeepWeekly 4", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Keep weekly full backups using GFS retention policy. Set 0 to disable or specify number of weeks. Example: -GFSKeepWeekly 4", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Keep weekly full backups using GFS retention policy. Set 0 to disable or specify number of weeks. Example: -GFSKeepWeekly 4", ParameterSetName='FileLevel')]
        [ValidateRange(0,100000)]
        [Nullable[int]]
        $GFSKeepWeekly,
        #
        [Parameter(Mandatory=$False, HelpMessage="Keep monthly full backups using GFS retention policy. Set 0 to disable or specify number of months. Example: -GFSKeepMonthly 12", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Keep monthly full backups using GFS retention policy. Set 0 to disable or specify number of months. Example: -GFSKeepMonthly 12", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Keep monthly full backups using GFS retention policy. Set 0 to disable or specify number of months. Example: -GFSKeepMonthly 12", ParameterSetName='FileLevel')]
        [ValidateRange(0,10000)]
        [Nullable[int]]
        $GFSKeepMonthly,
        #
        [Parameter(Mandatory=$False, HelpMessage="Keep yearly full backups using GFS retention policy. Set 0 to disable or specify number of years. Example: -GFSKeepYearly 5", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Keep yearly full backups using GFS retention policy. Set 0 to disable or specify number of years. Example: -GFSKeepYearly 5", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Keep yearly full backups using GFS retention policy. Set 0 to disable or specify number of years. Example: -GFSKeepYearly 5", ParameterSetName='FileLevel')]
        [ValidateRange(0,1000)]
        [Nullable[int]]
        $GFSKeepYearly,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify the month for the first successful full backup to be marked for GFS yearly retention. Example: -GFSMonthOfTheYear January", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify the month for the first successful full backup to be marked for GFS yearly retention. Example: -GFSMonthOfTheYear January", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify the month for the first successful full backup to be marked for GFS yearly retention. Example: -GFSMonthOfTheYear January", ParameterSetName='FileLevel')]
        [MBS.Agent.Plan.Month]
        $GFSMonthOfTheYear,
        #
        [Parameter(Mandatory=$False, HelpMessage='Enable Intelligent Retention for Forever Forward Incremental. Possible values: $true/$false. By default set to $true if Forever Forward Incremental is enabled', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Enable Intelligent Retention for Forever Forward Incremental. Possible values: $true/$false. By default set to $true if Forever Forward Incremental is enabled', ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage='Enable Intelligent Retention for Forever Forward Incremental. Possible values: $true/$false. By default set to $true if Forever Forward Incremental is enabled', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $IntelligentRetention,
        #-------------------------Full schedule -----------------------------------
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule recurring type. Possible values: day, week, month, dayofmonth", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule recurring type. Possible values: day, week, month, dayofmonth", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule recurring type. Possible values: day, week, month, dayofmonth", ParameterSetName='FileLevel')]
        [ValidateSet("day", "week", "month", "dayofmonth")]
        [string]
        $RecurringTypeForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' force full schedule (1..31)", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' force full schedule (1..31)", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day for 'dayofmonth' force full schedule (1..31)", ParameterSetName='FileLevel')]
        [Int32][ValidateRange(1,31)]
        $DayOfMonthForceFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly force full schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly force full schedule", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly force full schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly force full schedule", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify day(s) of week for weekly force full schedule. Example: ""su, mo, tu, we, th, fr, sa"". Or specify day of week for monthly force full schedule", ParameterSetName='FileLevel')]
        [ValidateSet("su", "mo", "tu", "we", "th", "fr", "sa")]
        [string[]]
        $weekdayForceFull,
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
        #[Parameter(Mandatory=$False, HelpMessage="Specify force full start date of repetitions", ParameterSetName='GFS')]
        #[Parameter(Mandatory=$False, HelpMessage="Specify rebackup datetime. Example: ""06/09/19 7:43 AM""", ParameterSetName='FileLevel')]
        #[string]
        #$rebackupDate,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable schedule of forced full backup", ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable schedule of forced full backup", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify to disable schedule of forced full backup", ParameterSetName='FileLevel')]
        [switch]
        $DisableForceFullSchedule,
        #
        #[Parameter(Mandatory=$False, HelpMessage='Use Synthetic Full backup (this parameter is NOT supported for all storage providers). Possible values: $true/$false', ParameterSetName='Common')]
        [Parameter(Mandatory=$False, HelpMessage='Use Synthetic Full backup (this parameter is NOT supported for all storage providers). Possible values: $true/$false', ParameterSetName='ImageBased')]
        #[Parameter(Mandatory=$False, HelpMessage='Use Synthetic Full backup (this parameter is NOT supported for all storage providers). Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $SyntheticFull,
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
        [Parameter(Mandatory=$False, HelpMessage='Back up EFS files as encrypted. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $KeepEFSEncryption,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use share read/write mode on errors. Can help if file is open in share read/write mode. Possible values: $true/$false', ParameterSetName='FileLevel')]
        [Nullable[boolean]]
        $UseShareReadWriteModeOnError,
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
        [Parameter(Mandatory=$False, HelpMessage="Type of volumes to backup. Possible values: AllVolumes, FixedVolumes, SystemRequired, SelectedVolumes", ParameterSetName='ImageBased')]
        [ValidateSet("AllVolumes", "FixedVolumes", "SystemRequired", "SelectedVolumes")]
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
        [Parameter(Mandatory=$False, HelpMessage="Enable KeepBitLocker option for volumes with specified IDs", ParameterSetName='ImageBased')]
        [string[]]
        $KeepBitLockerEnableForVolume,
        #
        [Parameter(Mandatory=$False, HelpMessage="Disable KeepBitLocker option for volumes with specified IDs", ParameterSetName='ImageBased')]
        [string[]]
        $KeepBitLockerDisableForVolume,
        #
        [Parameter(Mandatory=$False, HelpMessage='Run restore verification mode. Possible values: DoNotRun, RunForFull, RunForIncremental, RunForFullAndIncremental', ParameterSetName='ImageBased')]
        [Nullable[MBS.Agent.Plan.RestoreVerificationMode]]
        $RestoreVerificationMode
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
        if ($CBBVersion -lt [System.version]"7.1.0.0") {
            Write-Error "Version $($CBB.version) is not supported. Please upgrade to the minimum supported version 7.1"
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

        if ((($ForeverForwardIncremental -eq $True) -Or ($IntelligentRetention -eq $True)) -And (($GFSKeepWeekly -gt 0) -Or ($GFSKeepMonthly -gt 0) -Or ($GFSKeepYearly -gt 0) -Or ($($GFSMonthOfTheYear.value__) -gt 0))) {
            Write-Error "Forever Forward Incremental and GFS settings cannot be used at the same time"
            Break
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
            if ($DisableSchedule){
                $Argument += " -sd"
                if (-Not ($DisableForceFullSchedule)){$Argument += " -sdForce"}
            }
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
            if ($null -ne $FullConsistencyCheck){
                if ($FullConsistencyCheck) {
                    $Argument += " -fcCheck yes"
                }else{
                    $Argument += " -fcCheck no"
                }
            }
            #
            if($Null -ne $ForeverForwardIncremental) {
                if ($CBBVersion -ge [version]"7.8.0") {
                    if ($ForeverForwardIncremental) {
                        if (($BackupPlanStorageAccount.SGCloudTypeValue -eq "PhysicalFile") -Or ($BackupPlanStorageAccount.Type -eq "FileSystemConnection")) {
                            Write-Warning "Forever Forward Incremental cannot be enabled for file system storage destinations. Ignoring ForeverForwardIncremental option"
                        } else {
                            if ($RecurringType -And $At) {
                                $ForeverForwardIncrementalIsSet = $False
                                if ($Null -ne $KeepVersionPeriod) {
                                    $Argument += " -ffi yes"
                                    $ForeverForwardIncrementalIsSet = $True
                                } elseif ($BackupPlan.SerializationSupportRetentionTime -ne "10675199.02:48:05.4775807") {
                                    $KeepVersionPeriodFromPlan = ([timespan]$BackupPlan.SerializationSupportRetentionTime).TotalDays
                                    if ($KeepVersionPeriodFromPlan -eq 0) {
                                        $KeepVersionPeriodFromPlan = 30
                                        Write-Warning """KeepKeepVersionPeriod"" parameter not specified and existing retention policy is set to disabled while enabling Forever Forward Incremental. Retention setting to keep $KeepVersionPeriodFromPlan days will be used"
                                    } else {
                                        Write-Warning """KeepKeepVersionPeriod"" parameter not specified while enabling Forever Forward Incremental. Existing renetion policy setting (keep backup for $KeepVersionPeriodFromPlan days) will be used"
                                    }
                                    $Argument += " -ffi yes -purge $($KeepVersionPeriodFromPlan)d"
                                    $ForeverForwardIncrementalIsSet = $True
                                } else {
                                    Write-Warning """KeepKeepVersionPeriod"" parameter not specified and no retention policy specified in the current plan while enabling Forever Forward Incremental. Ignoring ForeverForwardIncremental option"
                                }
                                if (($ForeverForwardIncrementalIsSet) -And ($BackupPlan.GFSPolicySettings.IsEnabled)) {
                                    Write-Warning "GFS settings are enabled in the current plan while enabling Forever Forward Incremental. Disabling GFS settings"
                                    if (($GFSKeepWeekly -ne 0) -And ($BackupPlan.GFSPolicySettings.Weekly.IsEnabled)) {$Argument += " -gfsWDisable"}
                                    if (($GFSKeepMonthly -ne 0) -And ($BackupPlan.GFSPolicySettings.Monthly.IsEnabled)) {$Argument += " -gfsMDisable"}
                                    if (($GFSKeepYearly -ne 0) -And ($BackupPlan.GFSPolicySettings.Yearly.IsEnabled)) {$Argument += " -gfsYDisable"}
                                }
                            } else {
                                Write-Warning "Schedule settings not specified while enabling Forever Forward Incremental. Ignoring ForeverForwardIncremental option"
                            }
                        }
                    } else {
                        $Argument += " -ffi no"
                        if (($BackupPlan.Schedule.Enabled) -And (-Not ($RecurringType -And $At))) {
                            Write-Warning "The schedule settings will be set to ""No schedule"" while disabling Forever Forward Incremental"
                        }
                        if (($BackupPlan.ForceFullSchedule.Enabled) -And (-Not ($RecurringTypeForceFull))) {
                            if (-Not ($DisableForceFullSchedule)){$Argument += " -sdForce"}
                        }
                    }
                } else {
                    Write-Warning "Backup agent version is $CBBVersion. ""ForeverForwardIncremental"" parameter requires version 7.8.0 or higher. Ignoring ForeverForwardIncremental option"
                }
            }

            if($Null -ne $IntelligentRetention) {
                if ($CBBVersion -ge [version]"7.8.0") {
                    if ($IntelligentRetention) {
                        if (-Not($ForeverForwardIncremental -eq $False)) {
                            $Argument += " -ir yes"
                        } else {
                            Write-Warning """ForeverForwardIncremental"" parameter is set to False. Intelligent retention cannot be enabled without Forever Forward Incremental"
                        }
                    } else {
                        $Argument += " -ir no"
                    }
                } else {
                    Write-Warning "Backup agent version is $CBBVersion. ""IntelligentRetention"" parameter requires version 7.8.0 or higher. Ignoring IntelligentRetention option"
                }
            }
            #
            if($Null -ne $KeepVersionPeriod){
                if($KeepVersionPeriod -gt 0){
                    $Argument += " -purge $($KeepVersionPeriod)d"
                }else{
                    $Argument += " -purge no"
                }
            }

            if ((($GFSKeepWeekly -gt 0) -Or ($GFSKeepMonthly -gt 0) -Or ($GFSKeepYearly -gt 0) -Or ($($GFSMonthOfTheYear.value__) -gt 0)) -And ($ForeverForwardIncremental -ne $false) -And ($BackupPlan.ForwardIncremental)){
                Write-Warning "Forever Forward Incremental settings are enabled in the current plan while enabling GFS. Disabling Forever Forward Incremental option"
                $Argument += " -ffi no"
                if (($BackupPlan.Schedule.Enabled) -And (-Not ($RecurringType -And $At))) {
                    Write-Warning "The schedule settings will be set to ""No schedule"" while disabling Forever Forward Incremental"
                }
                if (($BackupPlan.ForceFullSchedule.Enabled) -And (-Not ($RecurringTypeForceFull))) {
                    if (-Not ($DisableForceFullSchedule)){$Argument += " -sdForce"}
                }
                if (($BackupPlan.SerializationSupportRetentionTime -ne "10675199.02:48:05.4775807") -And ($null -eq $KeepVersionPeriod)) {
                    $KeepVersionPeriodFromPlan = ([timespan]$BackupPlan.SerializationSupportRetentionTime).TotalDays
                    Write-Warning """KeepKeepVersionPeriod"" parameter not specified while switching from Forever Forward Incremental to GFS. Existing renetion policy setting (keep backup for $KeepVersionPeriodFromPlan days) will be used"
                    $Argument += " -purge $($KeepVersionPeriodFromPlan)d"
                }
            }
            
            if($Null -ne $GFSKeepWeekly){
                if($GFSKeepWeekly -gt 0){
                    $Argument += " -gfsW $($GFSKeepWeekly)"
                }else{
                    $Argument += " -gfsWDisable"
                }
            }
            if($Null -ne $GFSKeepMonthly){
                if($GFSKeepMonthly -gt 0){
                    $Argument += " -gfsM $($GFSKeepMonthly)"
                }else{
                    $Argument += " -gfsMDisable"
                }
            }
            if($Null -ne $GFSKeepYearly){
                if($GFSKeepYearly -gt 0){
                    $Argument += " -gfsY $($GFSKeepYearly)"
                }else{
                    $Argument += " -gfsYDisable"
                }
            }
            if($GFSMonthOfTheYear -gt 0){$Argument += " -gfsYMonth $($GFSMonthOfTheYear.value__)"}

            #
            if ($RecurringType){
                if ($RecurringType -eq "day") {
                    $Argument += " -every day"
                    $Weekday = "su,mo,tu,we,th,fr,sa"
                } elseif ($RecurringType -eq "week") {
                    $Argument += " -every day"
                    if ([string]::IsNullOrEmpty($Weekday)) {
                        Write-Warning "Parameter ""WeekDay"" not specified for weekly schedule. Setting schedule recurring type to daily"
                    }
                } else {
                    $Argument += " -every $RecurringType"
                }
            }
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

            if ($null -ne $runMissed){
                if ($runMissed) {
                    $Argument += " -runMissed yes"
                }else{
                    $Argument += " -runMissed no"
                }
            }
            
            if (($ForeverForwardIncremental) -And ($RecurringTypeForceFull -Or $DayOfMonthForceFull -Or $weekdayForceFull -Or $repeatEveryForceFull -Or $repeatStartDateForceFull)) {
                Write-Warning "Full schedule settings are not used when Forever Forward Incremental is enabled. Skipping full schedule parameters"
            } else {
                if ($RecurringTypeForceFull){
                    if ($RecurringTypeForceFull -eq "day") {
                        $Argument += " -everyForceFull day"
                        $weekdayForceFull = "su,mo,tu,we,th,fr,sa"
                    } elseif ($RecurringTypeForceFull -eq "week") {
                        $Argument += " -everyForceFull day"
                        if ([string]::IsNullOrEmpty($weekdayForceFull)) {
                            Write-Warning "Parameter ""weekdayForceFull"" not specified for weekly full schedule. Setting full schedule recurring type to daily"
                        }
                    } else {
                        $Argument += " -everyForceFull $RecurringTypeForceFull"
                    }
                }
                if ($DayOfMonthForceFull){$Argument += " -dayForceFull $DayOfMonthForceFull"}
                if ($weekdayForceFull){$Argument += " -weekdayForceFull $weekdayForceFull"}
                if ($repeatEveryForceFull){$Argument += " -repeatEveryForceFull $repeatEveryForceFull"}
                if ($repeatStartDateForceFull){$Argument += " -repeatStartDateForceFull $repeatStartDateForceFull"}
                #if ($rebackupDate){$Argument += " -rebackupDate $rebackupDate"}
            }
            if ($DisableForceFullSchedule){$Argument += " -sdForce"}

            if ($null -ne $SyntheticFull){
                if ($SyntheticFull) {
                    $Argument += " -syntheticFull yes"
                }else{
                    $Argument += " -syntheticFull no"
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
            if ($null -ne $KeepEFSEncryption){
                if ($CBBVersion -ge [version]"7.6.0.70") {
                    if ($KeepEFSEncryption) {
                        $Argument += " -keepEfsEncryption yes"
                    }else{
                        $Argument += " -keepEfsEncryption no"
                    }
                } else {
                    Write-Warning "Backup agent version is $CBBVersion. ""KeepEFSEncryption"" parameter requires version 7.6.0 or higher. Ignoring KeepEFSEncryption option"
                }
            }
            if ($null -ne $UseShareReadWriteModeOnError){
                if ($UseShareReadWriteModeOnError) {
                    $Argument += " -sharerw yes"
                }else{
                    $Argument += " -sharerw no"
                }
            }
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
                'FixedVolumes' {
                    if ($CBBVersion -ge [version]"7.2.2.10") {
                        $Argument += " -f"
                    } else {
                        Write-Warning "Backup agent version is $CBBVersion. ""FixedVolumes"" backup volume type requires version 7.2.2 or higher. Setting SystemRequired value"
                        $Argument += " -r"
                    }
                }
                'SystemRequired' {$Argument += " -r"}
                'SelectedVolumes' {
                    ForEach-Object -InputObject $Volumes -Process {
                        $Argument += " -v $_"
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

            switch ($RestoreVerificationMode) {
                'DoNotRun' {$Argument += " -rv None"}
                'RunForFull' {$Argument += " -rv OnFull"}
                'RunForIncremental' {$Argument += " -rv OnDiff"}
                'RunForFullAndIncremental' {$Argument += " -rv OnAll"}
                Default {}
            }
            
            Return $Argument
        }

        if ($_){
            $BackupPlanFromPipeline = $_
            #$ID = $BackupPlanFromPipeline.ID
            $BackupPlan = Get-MBSBackupPlan -OutputType Raw | Where-Object {$_.ID -eq $BackupPlanFromPipeline.ID}
        }else{
            if($ID){
                $BackupPlan = Get-MBSBackupPlan -OutputType Raw | Where-Object {$_.ID -eq $ID}
            }else{
                $BackupPlan = Get-MBSBackupPlan -OutputType Raw | Where-Object {$_.Name -eq $Name}
            }
        }

        $BackupPlanStorageAccount = Get-MBSStorageAccount -ID $BackupPlan.ConnectionID

        if($BackupPlan){
            if (-Not ($BackupPlan.IsArchive)) {
                Write-Host "Backup plan ""$($BackupPlan.Name)"" is not an NBF plan" -ForegroundColor Red
                return
            }
            if(($BackupPlan.Type -eq "Plan") -and $FileLevel){
                $Arguments = " editBackupPlan"
            }elseif (($BackupPlan.Type -eq "BackupDiskImagePlan") -and $ImageBased) {
                $Arguments = " editBackupIBBPlan"
            }elseif ($All) {
                switch ($BackupPlan.Type) {
                    'Plan' {$Arguments = " editBackupPlan"}
                    'BackupDiskImagePlan' {$Arguments = " editBackupIBBPlan"}
                    Default {
                        Write-host """$($BackupPlan.Type)"" type is not supported by the Cmdlet" -ForegroundColor Red
                        return
                    }
                }
            }else{
                Write-host "Backup plan ""$($BackupPlan.Name)"" is skipped because the type of plan and parameter set do not match" -ForegroundColor Red
                return
            }
        }else{
            Write-host "Backup plan with"$(if($ID){"ID ""$ID"""}else{"name ""$Name"""})"not found" -ForegroundColor Red
            return
        }
        
        if ($ID){
            $Arguments += " -id $ID"
        }else{
            $Arguments += " -n ""$Name"""
        }
        $Arguments += Set-Arguments
        if($Arguments -notmatch '^( editBackupPlan| editBackupIBBPlan) (-id [0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}|-n "[^"]*")$'){
            (Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword).result
        #} else {
        #    Write-Host "No settings to apply for backup plan with"$(if($ID){"ID ""$ID"""}else{"name ""$Name"""})
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
