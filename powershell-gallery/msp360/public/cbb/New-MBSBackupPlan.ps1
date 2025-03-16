function New-MBSBackupPlan {
    <#
    .SYNOPSIS
    Creates new backup plan.
    
    .DESCRIPTION
    Creates File-Level, Image-Based, Hyper-V, or MS SQL backup plan.
    
    .PARAMETER Name
    Backup plan name.
    
    .PARAMETER StorageAccount
    Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name "AWS S3")
    
    .PARAMETER MasterPassword
    Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string "Your_Password" -AsPlainText -Force)
    
    .PARAMETER Schedule
    Specify schedule. Use New-MBSPlanSchedule to create an object.
    
    .PARAMETER FullSchedule
    Specify force full schedule. Use New-MBSPlanSchedule to create an object.
    
    .PARAMETER MSSQLDiffSchedule
    Specify MS SQL Differential schedule. Use New-MBSPlanSchedule to create an object.
    
    .PARAMETER MSSQLTlogSchedule
    Specify MS SQL T-Log schedule. Use New-MBSPlanSchedule to create an object.
    
    .PARAMETER BackupPlanCommonOption
    Specify plan common options. Use New-MBSBackupPlanCommonOption to create an object.
    
    .PARAMETER UseBlockLevelBackup
    Use block level backup.
    
    .PARAMETER UseFastNTFSScan
    The Fast NTFS scan speeds up backup processing by using a low-level API for accessing NTFS structures. This option is useful for NTFS volumes with a large number of files. Enabling this option automatically enables ForceUsingVSS option

    .PARAMETER BackupNTFSPermissions
    Backup NTFS permissions
    
    .PARAMETER ForceUsingVSS
    Force using VSS (Volume Shadow Copy Service)
    
    .PARAMETER UseShareReadWriteModeOnError
    Use share read/write mode on errors. Can help if file is open in share read/write mode
    
    .PARAMETER DeleteLocallyDeletedFilesAfter
    Delete files that have been deleted locally after specified number of days. Example: -DeleteLocallyDeletedFilesAfter 30. .
    
    .PARAMETER BackupEmptyFolders
    Backup empty folders
    
    .PARAMETER BackupOnlyAfter
    Backup files only after specific date. Example: "06/09/19 7:43 AM"
    
    .PARAMETER ExcludeSystemHiddenFiles
    Exclude system and hidden files from backup plan.
    
    .PARAMETER SkipFolder
    Skip folders. Example: -skipfolder ""bin,*temp*,My*""
    
    .PARAMETER IncludeFilesMask
    Include files mask. Example: -IncludeFilesMask ""*.doc,*.xls""
    
    .PARAMETER ExcludeFilesMask
    Exclude files mask. Example: -ExcludeFilesMask ""*.bak,*.tmp""
    
    .PARAMETER IgnoreErrorPathNotFound
    Ignore errors path not found
    
    .PARAMETER TrackDeletedFiles
    Track deleted files data
    
    .PARAMETER BackupFile
    Backup file path. Example: "c:\temp\test.txt","c:\temp\test.ps1"
    
    .PARAMETER BackupDirectory
    Backup directory path. Example: "c:\Work","c:\Users"

    .PARAMETER ExcludeFile
    Exclude a file from backup plan. Example: "c:\temp\test2.txt","c:\temp\test2.ps1"

    .PARAMETER ExcludeDirectory
    Exclude a directory from backup plan. Example: "c:\Program Files","c:\Windows"

    .PARAMETER GenerateDetailedReport
    Specify to generate detailed report
    
    .PARAMETER BackupVolumes
    Backup Volumes type. 
    
    .PARAMETER Volumes
    Backup selected volumes with the specified ids
    
    .PARAMETER DisableVSS
    Disable VSS, use direct access to NTFS volume
    
    .PARAMETER IgnoreBadSectors
    Ignore bad sectors
    
    .PARAMETER UseSystemVSS
    Use system VSS provider
    
    .PARAMETER DisableSyntheticFull
    Disable Synthetic Full backup.
    
    .PARAMETER PrefetchBlockCount
    Prefetch block count (0 - 100, 0 without prefetch)
    
    .PARAMETER BlockSize
    Block size. Possible values: 128, 256, 512, 1024

    .PARAMETER ExcludeItem
    Exclude files/folders from Image-Based backup plan. Example: "C:\bin","C:\Users","\\?\\Volume{2b7ea38e-0854-44a9-90f8-259fe8d52d20}\Recovery"

    .PARAMETER KeepBitLocker
    Enable KeepBitLocker option for all partitions

    .PARAMETER KeepBitLockerEnableForVolume
    Enable KeepBitLocker option for volumes with specified ids. Example: "cc9eb5c7-f956-415c-b23e-e6a563f9a20e","c4f8f0d6-7a2a-4627-9c89-cc84dbe3bf79"

    .PARAMETER KeepBitLockerDisableForVolume
    Disable KeepBitLocker option for volumes with specified ids. Example: "01bc714b-b611-448e-8fff-2e0e4a0d9004","a44e3efd-17ef-4f2c-bd66-5cbda5f23939"

    .PARAMETER BackupVM
    Backup Virtual Machine type
    
    .PARAMETER VirtualMachine
    Backup selected virtual machines only the specified names
    
    .PARAMETER InstanceName
    MS SQL server instance name
    
    .PARAMETER useSSL
    Use secure connection (SSL/TLS)
    
    .PARAMETER useWinauth
    Use Windows authentication
    
    .PARAMETER UserName
    MS SQL server user name
    
    .PARAMETER Password
    MS SQL server password
    
    .PARAMETER BackupDB
    Database selection type
    
    .PARAMETER Databases
    Select backup database
    
    .PARAMETER CopyOnly
    Use copy only
    
    .PARAMETER Verify
    Verify
    
    .EXAMPLE
    New-MBSBackupPlan -Name "IBB Plan" -StorageAccount (Get-MBSStorageAccount -ID aa3230dc-c20f-4ff3-83be-1cf6820de46b) -BackupVolumes AllVolumes -Schedule $schedule -BackupPlanCommonOption $commonOptions
    
    Create Image-Based backup plan.

    .EXAMPLE
    New-MBSBackupPlan -Name "File-level Plan" -StorageAccount (Get-MBSStorageAccount -ID aa3230dc-c20f-4ff3-83be-1cf6820de46b) -BackupFile "c:\temp\test.txt","c:\temp\test.ps1" -BackupDirectory "c:\Work","c:\Users" -Schedule $schedule -BackupPlanCommonOption $commonOptions

    Create File-Level backup plan.
    
    .EXAMPLE
    New-MBSBackupPlan -Name "HyperV plan" -StorageAccount (Get-MBSStorageAccount -ID aa3230dc-c20f-4ff3-83be-1cf6820de46b) -Schedule $DailySchedule -BackupVM All

    Create Hyper-V backup plan to backup all virtual machines.

    .EXAMPLE
    New-MBSBackupPlan -Name "MS SQL plan" -StorageAccount (Get-MBSStorageAccount -ID aa3230dc-c20f-4ff3-83be-1cf6820de46b) -Schedule $DailySchedule -InstanceName "host\sqlexpress" -MSSQLTlogSchedule $DiffSchedule -BackupPlanCommonOption $commonOptions -useSSL -useWinauth -BackupDB All

    Create MS SQL backup plan to backup all databases.

    .INPUTS
        None.

    .OUTPUTS
        None.

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/backup-agent/new-mbsbackupplan
    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$true, HelpMessage="Backup plan name.")]
        [string]
        $Name,
        # 
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")", ParameterSetName='HyperV')]
        [Parameter(Mandatory=$true, HelpMessage="Specify storage account object. Use Get-MBSStorageAccount cmdlet to list storages. Example: (Get-MBSStorageAccount -Name ""AWS S3"")", ParameterSetName='MSSQL')]
        [MBS.Agent.StorageAccount]
        $StorageAccount,
        #
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='HyperV')]
        [Parameter(Mandatory=$False, HelpMessage="Master password. Should be specified if configuration is protected by master password. Use -MasterPassword (ConvertTo-SecureString -string ""Your_Password"" -AsPlainText -Force)", ParameterSetName='MSSQL')]
        [SecureString]
        $MasterPassword,
        
        # ------------------------- Schedule -----------------------------
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule. Use New-MBSPlanSchedule to create an object.", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule. Use New-MBSPlanSchedule to create an object.", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule. Use New-MBSPlanSchedule to create an object.", ParameterSetName='HyperV')]
        [Parameter(Mandatory=$False, HelpMessage="Specify schedule. Use New-MBSPlanSchedule to create an object.", ParameterSetName='MSSQL')]
        [MBS.Agent.Plan.Schedule]
        $Schedule,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule. Use New-MBSPlanSchedule to create an object.", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule. Use New-MBSPlanSchedule to create an object.", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$False, HelpMessage="Specify force full schedule. Use New-MBSPlanSchedule to create an object.", ParameterSetName='HyperV')]
        [MBS.Agent.Plan.Schedule]
        $FullSchedule,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify MS SQL Differential schedule. Use New-MBSPlanSchedule to create an object.", ParameterSetName='MSSQL')]
        [MBS.Agent.Plan.Schedule]
        $MSSQLDiffSchedule,
        #
        [Parameter(Mandatory=$False, HelpMessage="Specify MS SQL T-Log schedule. Use New-MBSPlanSchedule to create an object.", ParameterSetName='MSSQL')]
        [MBS.Agent.Plan.Schedule]
        $MSSQLTlogSchedule,

        # ------------------------- Common options -----------------------------
        [Parameter(Mandatory=$true, HelpMessage="Specify plan common options. Use New-MBSBackupPlanCommonOption to create an object.", ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$true, HelpMessage="Specify plan common options. Use New-MBSBackupPlanCommonOption to create an object.", ParameterSetName='ImageBased')]
        [Parameter(Mandatory=$true, HelpMessage="Specify plan common options. Use New-MBSBackupPlanCommonOption to create an object.", ParameterSetName='HyperV')]
        [Parameter(Mandatory=$true, HelpMessage="Specify plan common options. Use New-MBSBackupPlanCommonOption to create an object.", ParameterSetName='MSSQL')]
        [MBS.Agent.Plan.BackupPlanCommonOption]
        $BackupPlanCommonOption,
        
        #---------------------------- Block Level ------------------
        [Parameter(Mandatory=$False, HelpMessage='Use block level backup.', ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$False, HelpMessage='Use block level backup.', ParameterSetName='ImageBased')]
        [Switch]
        $UseBlockLevelBackup,

        # --------------------------- File Backup settings ------------

        [Parameter(Mandatory=$False, HelpMessage='The Fast NTFS scan speeds up backup processing by using a low-level API for accessing NTFS structures. This option is useful for NTFS volumes with a large number of files. Enabling this option automatically enables ForceUsingVSS option', ParameterSetName='FileLevel')]
        [Switch]
        $UseFastNTFSScan,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup NTFS permissions", ParameterSetName='FileLevel')]
        [Switch]
        $BackupNTFSPermissions,
        #
        [Parameter(Mandatory=$False, HelpMessage='Force using VSS (Volume Shadow Copy Service).', ParameterSetName='FileLevel')]
        [Switch]
        $ForceUsingVSS,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use share read/write mode on errors. Can help if file is open in share read/write mode.', ParameterSetName='FileLevel')]
        [Switch]
        $UseShareReadWriteModeOnError,
        #
        [Parameter(Mandatory=$False, HelpMessage="Delete files that have been deleted locally after specified number of days. Example: -DeleteLocallyDeletedFilesAfter 30.", ParameterSetName='FileLevel')]
        [timespan]
        $DeleteLocallyDeletedFilesAfter,
        #
        [Parameter(Mandatory=$False, HelpMessage='Backup empty folders.', ParameterSetName='FileLevel')]
        [Switch]
        $BackupEmptyFolders,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup files only after specific date. Example: ""06/09/19 7:43 AM""", ParameterSetName='FileLevel')]
        [datetime]
        $BackupOnlyAfter,
        #
        [Parameter(Mandatory=$False, HelpMessage='Exclude system and hidden files.', ParameterSetName='FileLevel')]
        [bool]
        $ExcludeSystemHiddenFiles=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage="Skip folders. Example: -skipfolder ""bin,*temp*,My*""", ParameterSetName='FileLevel')]
        [string[]]
        $SkipFolder,
        #
        [Parameter(Mandatory=$False, HelpMessage="Include files mask. Example: -IncludeFilesMask ""*.doc,*.xls""", ParameterSetName='FileLevel')]
        [string[]]
        $IncludeFilesMask,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude files mask. Example: -ExcludeFilesMask ""*.bak,*.tmp""", ParameterSetName='FileLevel')]
        [string[]]
        $ExcludeFilesMask,
        #
        [Parameter(Mandatory=$False, HelpMessage='Ignore errors path not found.', ParameterSetName='FileLevel')]
        [Switch]
        $IgnoreErrorPathNotFound,
        #
        [Parameter(Mandatory=$False, HelpMessage='Track deleted files data.', ParameterSetName='FileLevel')]
        [Switch]
        $TrackDeletedFiles,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup file", ParameterSetName='FileLevel')]
        [string[]]
        $BackupFile,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup directory", ParameterSetName='FileLevel')]
        [string[]]
        $BackupDirectory,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude a file from backup plan", ParameterSetName='FileLevel')]
        [string[]]
        $ExcludeFile,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude a directory from backup plan", ParameterSetName='FileLevel')]
        [string[]]
        $ExcludeDirectory,
        #
        [Parameter(Mandatory=$False, HelpMessage='Specify to generate detailed report.', ParameterSetName='FileLevel')]
        [Parameter(Mandatory=$False, HelpMessage='Specify to generate detailed report.', ParameterSetName='MSSQL')]
        [Switch]
        $GenerateDetailedReport,
        # ------------------------- Image-Based --------------------------------------
        [Parameter(Mandatory=$true, HelpMessage="Backup Volumes type", ParameterSetName='ImageBased')]
        [ValidateSet("AllVolumes", "SystemRequired", "SelectedVolumes")]
        [string]
        $BackupVolumes,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup selected volumes with the specified ids.", ParameterSetName='ImageBased')]
        [string[]]
        $Volumes,
        #
        [Parameter(Mandatory=$False, HelpMessage='Disable VSS, use direct access to NTFS volume.', ParameterSetName='ImageBased')]
        [Switch]
        $DisableVSS,
        #
        [Parameter(Mandatory=$False, HelpMessage='Ignore bad sectors.', ParameterSetName='ImageBased')]
        [bool]
        $IgnoreBadSectors=$true,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use system VSS provider.', ParameterSetName='ImageBased')]
        [Switch]
        $UseSystemVSS,
        #
        [Parameter(Mandatory=$False, HelpMessage='Disable Synthetic Full backup.', ParameterSetName='ImageBased')]
        [Switch]
        $DisableSyntheticFull,
        #
        [Parameter(Mandatory=$False, HelpMessage="Prefetch block count (0 - 100, 0 without prefetch)", ParameterSetName='ImageBased')]
        [Int32][ValidateRange(0,100)]
        $PrefetchBlockCount,
        #
        [Parameter(Mandatory=$False, HelpMessage="Block size. Possible values: 128, 256, 512, 1024", ParameterSetName='ImageBased')]
        [ValidateSet("128", "256", "512", "1024")]
        [string]
        $BlockSize,
        #
        [Parameter(Mandatory=$False, HelpMessage="Exclude files/folders from Image-Based backup plan", ParameterSetName='ImageBased')]
        [string[]]
        $ExcludeItem,
        #
        [Parameter(Mandatory=$False, HelpMessage='Enable KeepBitLocker option for all partitions', ParameterSetName='ImageBased')]
        [switch]
        $KeepBitLocker,
        #
        [Parameter(Mandatory=$False, HelpMessage="Enable KeepBitLocker option for volumes with specified ids", ParameterSetName='ImageBased')]
        [string[]]
        $KeepBitLockerEnableForVolume,
        #
        [Parameter(Mandatory=$False, HelpMessage="Disable KeepBitLocker option for volumes with specified ids", ParameterSetName='ImageBased')]
        [string[]]
        $KeepBitLockerDisableForVolume,
        # ------------------------- Hyper-V --------------------------------------
        [Parameter(Mandatory=$true, HelpMessage="Backup Virtual Machine type", ParameterSetName='HyperV')]
        #[ValidateSet("All", "OnlyRunning", "SelectedVM")]
        [MBS.Agent.Plan.BackupVMType]
        $BackupVM,
        #
        [Parameter(Mandatory=$False, HelpMessage="Backup selected virtual machines only the specified names.", ParameterSetName='HyperV')]
        [string[]]
        $VirtualMachine,
        # ------------------------- MS SQL --------------------------------------
        [Parameter(Mandatory=$true, HelpMessage="MS SQL server instance name", ParameterSetName='MSSQL')]
        [string]
        $InstanceName,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use secure connection (SSL/TLS).', ParameterSetName='MSSQL')]
        [Switch]
        $useSSL,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use Windows authentication.', ParameterSetName='MSSQL')]
        [Switch]
        $useWinauth,
        #
        [Parameter(Mandatory=$False, HelpMessage="MS SQL server user name", ParameterSetName='MSSQL')]
        [string]
        $UserName,
        #
        [Parameter(Mandatory=$False, HelpMessage="MS SQL server password", ParameterSetName='MSSQL')]
        [Securestring]
        $Password,
        #
        [Parameter(Mandatory=$False, HelpMessage="Database selection type", ParameterSetName='MSSQL')]
        #[ValidateSet("All", "User", "Selected")]
        [MBS.Agent.Plan.DatabaseSelectionType]
        $BackupDB,
        #
        [Parameter(Mandatory=$False, HelpMessage="Select backup database.", ParameterSetName='MSSQL')]
        [string[]]
        $Databases,
        #
        [Parameter(Mandatory=$False, HelpMessage='Use copy only.', ParameterSetName='MSSQL')]
        [Switch]
        $CopyOnly,
        #
        [Parameter(Mandatory=$False, HelpMessage='Verify.', ParameterSetName='MSSQL')]
        [Switch]
        $Verify

    )
    
    begin {
        if (-not($CBB = Get-MBSAgent)) {
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

        function Set-Schedule {
            param (
                [Parameter()]
                [psobject]
                $Schedule,
                [Parameter()]
                [string]
                $Prefix = ''
            )
            switch ($Schedule.Frequency) {
                Daily {$ScheduleCli += " -every$prefix day"}
                Weekly {$ScheduleCli += " -every$prefix week"}
                Monthly {$ScheduleCli += " -every$prefix month"}
                dayofmonth {$ScheduleCli += " -every$prefix dayofmonth"}
                Realtime {$ScheduleCli += " -every$prefix real-time"}
                Default {
                    #Write-Host "Schedule frequency is not specified."
                    #Break
                }
            }
            if ($Schedule.At){$ScheduleCli += " -at$prefix ""$($Schedule.At.ToString())"""}
            if ($Schedule.DayOfMonth){$ScheduleCli += " -day$prefix $($Schedule.DayOfMonth)"}
            if ($null -ne $Schedule.DayOfWeek){$ScheduleCli += " -weekday$prefix "+(($Schedule.DayOfWeek | foreach-object -Begin {$weekdaylocal = @()} -Process{$weekdaylocal += $_.ToString().Substring(0,2)} -End {return $weekdaylocal.ToLower()}) -join ",")}
            if ($Schedule.Weeknumber){$ScheduleCli += " -weeknumber$prefix $($Schedule.Weeknumber)"}
            if ($Schedule.OccursFrom){$ScheduleCli += " -dailyFrom$prefix $($Schedule.OccursFrom.ToString('hh\:mm'))"}
            if ($Schedule.OccursTo){$ScheduleCli += " -dailyTill$prefix $($Schedule.OccursTo.ToString('hh\:mm'))"}
            if ($Schedule.OccursEvery.TotalMinutes -ne 0){
                if ($Schedule.OccursEvery.TotalHours -gt 180){
                    $ScheduleCli += " -occurs$prefix hour -occurValue$prefix 180"
                }elseif($Schedule.OccursEvery.TotalHours -lt 180 -and $Schedule.OccursEvery.TotalHours -ge 1){
                    $ScheduleCli += " -occurs$prefix hour -occurValue$prefix $([Math]::Round($Schedule.OccursEvery.TotalHours))"
                }elseif($Schedule.OccursEvery.TotalHours -lt 1 -and $Schedule.OccursEvery.TotalMinutes -ge 1){
                    $ScheduleCli += " -occurs$prefix min -occurValue$prefix $([Math]::Round($Schedule.OccursEvery.TotalMinutes))"
                }else{
                    Write-host "Schedule 'OccursEvery' parameter cannot be less then 1 minute."
                }
            }
            if ($Schedule.RepeatInterval){$ScheduleCli += " -repeatEvery$prefix $($Schedule.RepeatInterval)"}
            if ($Schedule.RepeatStartDate){$ScheduleCli += " -repeatStartDate$prefix ""$($Schedule.RepeatStartDate.ToString())"""}   

            return $Schedulecli

        }
        function Set-Argument {
            if ($Name){$Argument += " -n ""$Name"""}
            if(($BackupPlanCommonOption.StorageClass -ne 'Standard') -And (-Not ($Global:MSP360ModuleSettings.SkipStorageClass))){
                if (($BackupPlanCommonOption.StorageClass -eq 'GlacierInstantRetrieval') -And ($CBBVersion -lt [version]"7.3.1")){
                    Write-Warning "Backup agent version is $CBBVersion. GlacierInstantRetrieval storage class is supported in version 7.3.1 or higher. Ignoring StorageClass option"
                    $Argument += " -aid ""$($StorageAccount.ID)"""
                }else{
                    $Argument += " -a ""$($StorageAccount.DisplayName)"" -sc ""$($BackupPlanCommonOption.StorageClass)"""
                }
            }else{
                if($Global:MSP360ModuleSettings.SkipStorageClass){
                    Write-Warning "MSP360ModuleSettings.SkipStorageClass is set. Ignoring StorageClass option"
                }
                $Argument += " -aid ""$($StorageAccount.ID)"""
            }

            if ($useBlockLevelBackup) {$Argument += " -useBlockLevelBackup yes"}

            if($Schedule){$Argument += Set-Schedule -Schedule $Schedule}
            if($FullSchedule){
                if ((($PSCmdlet.ParameterSetName -eq 'FileLevel') -Or ($PSCmdlet.ParameterSetName -eq 'ImageBased')) -And (-Not ($useBlockLevelBackup))) {
                    Write-Warning "Full schedule options specified but ""useBlockLevelBackup"" parameter is not enabled. Enabling ""useBlockLevelBackup"" parameter..."
                    $Argument += " -useBlockLevelBackup yes"
                }
                $Argument += Set-Schedule -Schedule $FullSchedule -Prefix "ForceFull"
            }
            if($MSSQLDiffSchedule){$Argument += Set-Schedule -Schedule $MSSQLDiffSchedule -Prefix "Diff"}
            if($MSSQLTlogSchedule){$Argument += Set-Schedule -Schedule $MSSQLTlogSchedule -Prefix "TLog"}
            
            
            if($BackupPlanCommonOption.SyncRepositoryBeforeRun){$Argument += " -sync yes"}#else{$Argument += " -sync no"}
            if(-Not ($Global:MSP360ModuleSettings.SkipSSE)) {
                if($BackupPlanCommonOption.UseServerSideEncryption){$Argument += " -sse yes"}else{$Argument += " -sse no"}
            } else {
                Write-Warning "MSP360ModuleSettings.SkipSSE is set. Ignoring UseServerSideEncryption option"
            }
            if(-Not ($Global:MSP360ModuleSettings.SkipEncryption)) {
                if($Null -ne $BackupPlanCommonOption.EncryptionPassword){$Argument += " -ea $($BackupPlanCommonOption.EncryptionAlgorithm)"}
                if($BackupPlanCommonOption.EncryptionPassword){$Argument += " -ep """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($BackupPlanCommonOption.EncryptionPassword)))+""""}
            } else {
                Write-Warning "MSP360ModuleSettings.SkipEncryption is set. Ignoring EncryptionPassword and EncryptionAlgorithm options"
            }
            if(-Not ($Global:MSP360ModuleSettings.SkipCompression)) {
                if($BackupPlanCommonOption.UseCompression){$Argument += " -c yes"}else{$Argument += " -c no"}
            } else {
                Write-Warning "MSP360ModuleSettings.SkipCompression is set. Ignoring UseCompression option"
            }
            
            if($BackupPlanCommonOption.SaveBackupPlanConfiguration){
                $Argument += " -sp yes"
            }else{
                $Argument += " -sp no"
            }
            if($BackupPlanCommonOption.StopIfPlanRunsFor.TotalMinutes -gt 0){$Argument += " -stopAfter $( [math]::Round($BackupPlanCommonOption.StopIfPlanRunsFor.TotalHours)):$($BackupPlanCommonOption.StopIfPlanRunsFor.Minutes)"}
            if($BackupPlanCommonOption.RunMissedPlanImmediately){$Argument += " -runMissed yes"}else{$Argument += " -runMissed no"}
            if($BackupPlanCommonOption.PreActionCommand){$Argument += " -preAction $($BackupPlanCommonOption.PreActionCommand)"}
            if($Null -ne $BackupPlanCommonOption.PreActionContinueAnyway){
                if($BackupPlanCommonOption.PreActionContinueAnyway){
                    $Argument += " -pac yes"
                } else {
                    $Argument += " -pac no"
                }
            }
            if($BackupPlanCommonOption.PostActionCommand){$Argument += " -postAction $($BackupPlanCommonOption.PostActionCommand)"}
            if($Null -ne $BackupPlanCommonOption.PostActionRunAnyway){
                if($BackupPlanCommonOption.PostActionRunAnyway){
                    $Argument += " -paa yes"
                } else {
                    $Argument += " -paa no"
                }
            }
            if ($BackupPlanCommonOption.BackupChainPlanID) {
                if ($CBBVersion -ge [version]"7.2.1.0") {
                    $Argument += " -chainPlanOn $($BackupPlanCommonOption.BackupChainPlanID)"
                    if ($null -ne $BackupPlanCommonOption.BackupChainExecuteOnlyAfterSuccess) {
                        if ($BackupPlanCommonOption.BackupChainExecuteOnlyAfterSuccess) {
                            $Argument += " -chainPlanAfterSuccess yes"
                        }else{
                            $Argument += " -chainPlanAfterSuccess no"
                        }
                    }
                    if ($null -ne $BackupPlanCommonOption.BackupChainExecuteForceFull) {
                        if ($BackupPlanCommonOption.BackupChainExecuteForceFull) {
                            $Argument += " -chainPlanForceFull yes"
                        }else{
                            $Argument += " -chainPlanForceFull no"
                        }
                    }
                }else{
                    Write-Warning "Backup agent version is $CBBVersion. Backup chain parameters require version 7.2.1 or higher. Ignoring backup chain options"
                }
            }

            if($Null -ne $BackupPlanCommonOption.ResultEmailNotification){$Argument += " -notification $($BackupPlanCommonOption.ResultEmailNotification)"}
            if($Null -ne $BackupPlanCommonOption.AddEventToWindowsLog){$Argument += " -winLog $($BackupPlanCommonOption.AddEventToWindowsLog)"}
            if($Null -ne $BackupPlanCommonOption.KeepVersionPeriod){
                if($BackupPlanCommonOption.KeepVersionPeriod -gt 0){
                    $Argument += " -purge $($BackupPlanCommonOption.KeepVersionPeriod)d"
                }else{
                    $Argument += " -purge no"
                }
            }
            if($Null -ne $BackupPlanCommonOption.KeepNumberOfVersion){
                if($BackupPlanCommonOption.KeepNumberOfVersion -gt 0){
                    $Argument += " -keep $($BackupPlanCommonOption.KeepNumberOfVersion)"
                }elseif ($BackupPlanCommonOption.KeepNumberOfVersion -eq 0) {
                    $Argument += " -keep all"
                }
            }
            if($Null -ne $BackupPlanCommonOption.KeepLastVersion){
                if ($BackupPlanCommonOption.KeepLastVersion){
                    $Argument += " -keepLastVersion yes"
                }else{
                    $Argument += " -keepLastVersion no"
                }
            }
            if($Null -ne $BackupPlanCommonOption.DelayPurgePeriod){
                if($BackupPlanCommonOption.DelayPurgePeriod -gt 0){
                    $Argument += " -delayPurge $($BackupPlanCommonOption.DelayPurgePeriod)d"
                }else{
                    $Argument += " -delayPurge no"
                }
            }

            switch ($PSCmdlet.ParameterSetName){
                'FileLevel' {
                # --------- File-Level ------------
                    #$Argument += " addBackupPlan"
                    if ($UseFastNTFSScan) {
                        if ($CBBVersion -ge [version]"7.1.0.0") {
                            $Argument += " -fastNtfs yes"
                        } else {
                            Write-Warning "Backup agent version is $CBBVersion. ""UseFastNTFSScan"" parameter requires version 7.1.0 or higher. Ignoring UseFastNTFSScan option"
                        }
                    } else {
                        if ($CBBVersion -ge [version]"7.1.0.0") {
                            $Argument += " -fastNtfs no"
                        }
                    }
                    if ($BackupNTFSPermissions) {$Argument += " -ntfs yes"}
                    if(-Not ($Global:MSP360ModuleSettings.SkipVSS)) {
                        if ($ForceUsingVSS) {$Argument += " -vss yes"}else{$Argument += " -vss no"}
                    } else {
                        Write-Warning "MSP360ModuleSettings.SkipVSS is set. Ignoring ForceUsingVSS option"
                    }
                    if ($UseShareReadWriteModeOnError) {$Argument += " -sharerw yes"}
                    if ($DeleteLocallyDeletedFilesAfter){$Argument += " -df $($DeleteLocallyDeletedFilesAfter.TotalDays)"}
                    if ($BackupEmptyFolders) {$Argument += " -bef yes"}
                    if ($BackupOnlyAfter){$Argument += " -oa $($BackupOnlyAfter.ToString('MM/dd/yyyy HH:mm tt'))"}
                    if ($ExcludeSystemHiddenFiles) {
                        $Argument += " -es yes"
                    }else{
                        $Argument += " -es no"
                    }
                    if ($SkipFolder){$Argument += " -skipf ""$($SkipFolder -join ';' -replace ',',';')"""}
                    if ($IncludeFilesMask){$Argument += " -ifm $($IncludeFilesMask -join ';' -replace ',',';')"}
                    if ($ExcludeFilesMask){$Argument += " -efm $($ExcludeFilesMask -join ';' -replace ',',';')"}
                    if ($IgnoreErrorPathNotFound) {$Argument += " -iepnf yes"}
                    if ($TrackDeletedFiles) {$Argument += " -trackdeleted yes"}
                    if ($BackupFile){$Argument += " -f "+'"{0}"' -f ($BackupFile -join '" -f "')}
                    if ($BackupDirectory){$Argument += " -d "+'"{0}"' -f ($BackupDirectory -join '" -d "')}
                    if ($ExcludeFile) {
                        if ($CBBVersion -ge [version]"7.5.0") {
                            $Argument += " -rf "+'"{0}"' -f ($ExcludeFile -join '" -rf "')
                        }else{
                            Write-Warning "Backup agent version is $CBBVersion. ""ExcludeFile"" parameter requires version 7.5.0 or higher. Ignoring ExcludeFile option"
                        }
                    }
                    if ($ExcludeDirectory) {
                        if ($CBBVersion -ge [version]"7.5.0") {
                            $Argument += " -rd "+'"{0}"' -f ($ExcludeDirectory -join '" -rd "')
                        }else{
                            Write-Warning "Backup agent version is $CBBVersion. ""ExcludeDirectory"" parameter requires version 7.5.0 or higher. Ignoring ExcludeDirectory option"
                        }
                    }
                    if ($GenerateDetailedReport) {
                        $Argument += " -dr yes"
                    }else{
                        $Argument += " -dr no"
                    }
                }   

                'ImageBased' {
                    # ------------- Image-Based -------------
                    #$Argument += " addBackupIBBPlan"    
                    switch ($BackupVolumes) {
                        'AllVolumes' {$Argument += " -av"}
                        'SystemRequired' {$Argument += " -r"}
                        'SelectedVolumes' {
                            $Volumes | ForEach-Object -Process {
                                $Argument += " -v $_"
                            }
                        }
                        Default {}
                    }

                    if ($disableVSS) {$Argument += " -disableVSS yes"}
                    if ($ignoreBadSectors) {
                        $Argument += " -ignoreBadSectors yes"
                    }else{
                        $Argument += " -ignoreBadSectors no"
                    }
                    if ($useSystemVSS) {$Argument += " -useSystemVSS yes"}
                    if ($DisableSyntheticFull) {$Argument += " -syntheticFull no"}
                    if ($prefetchBlockCount){$Argument += " -prefetchBlockCount $prefetchBlockCount"}
                    if ($blockSize){$Argument += " -blockSize $blockSize"}
                    if ($ExcludeItem) {
                        if ($CBBVersion -ge [version]"6.4.0") {
                            $Argument += " -skipf "+'"{0}"' -f ($ExcludeItem -join '" -skipf "')
                        } else {
                            Write-Warning "Backup agent version is $CBBVersion. ""ExcludeItem"" parameter requires version 6.4.0 or higher. Ignoring ExcludeItem option"
                        }
                    }
                    if ($KeepBitLocker) {
                        if ($CBBVersion -ge [version]"7.2.2.0") {
                            $Argument += " -keepBitlocker yes"
                        } else {
                            Write-Warning "Backup agent version is $CBBVersion. ""KeepBitLocker"" parameter requires version 7.2.2 or higher. Ignoring KeepBitLocker option"
                        }
                    #} else {
                        #if (($CBBVersion -ge [version]"7.2.2.0") -And (-Not($KeepBitLockerEnableForVolume)) -And (-Not($KeepBitLockerDisableForVolume))) {
                        #    $Argument += " -keepBitlocker no"
                        #}
                    }
                    if ($KeepBitLockerEnableForVolume) {
                        if ($CBBVersion -ge [version]"7.2.2.0") {
                            if (-Not($KeepBitLocker)) {
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
                            if (-Not($KeepBitLocker)) {
                                $Argument += " -keepBitlockerOff "+'"{0}"' -f ($KeepBitLockerDisableForVolume -join '" -keepBitlockerOff "')
                            } else {
                                Write-Warning """KeepBitLocker"" and ""KeepBitLockerDisableForVolume"" parameters are mutually exclusive. Ignoring KeepBitLockerDisableForVolume option"
                            }
                        }else{
                            Write-Warning "Backup agent version is $CBBVersion. ""KeepBitLockerDisableForVolume"" parameter requires version 7.2.2 or higher. Ignoring KeepBitLockerDisableForVolume option"
                        }
                    }
                }
                'HyperV' { 
                    # ------------- Hyper-V -------------
                    #$Argument += " addHyperVPlan"
                    switch ($BackupVM) {
                        'All' {$Argument += " -all"}
                        'OnlyRunning' {$Argument += " -r"}
                        'SelectedVM' {$Argument += " -v "+"'$($VirtualMachine -join "' -v '")'"}
                        Default {}
                    }
                }  
                'MSSQL' {
                    # ------------- MS SQL -------------
                    #$Argument += " addBackupMSSQLPlan"
                    if ($InstanceName){$Argument += " -instancename $InstanceName"}
                    if ($useSSL){$Argument += " -secure yes"}
                    if ($useWinauth){$Argument += " -winauth yes"}
                    if ($UserName){$Argument += " -username $UserName"}
                    if ($Password){$Argument += " -password """+([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)))+""""}
                    switch ($BackupDB) {
                        'All' {$Argument += " -dbselectiontype All"}
                        'User' {$Argument += " -dbselectiontype User"}
                        'SelectedDB' {$Argument += " -dbselectiontype Selected"}
                        Default {}
                    }
                    if ($Databases){$Argument += " -databases ""$($Databases -join ";")"""}
                    if ($CopyOnly){$Argument += " -copyonly yes"}
                    if ($Verify){$Argument += " -verify yes"}
                }
                Default {}
            }

            Return $Argument
        }

        switch ($PSCmdlet.ParameterSetName){
            'FileLevel' {$Arguments += " addBackupPlan"}
            'ImageBased' {$Arguments += " addBackupIBBPlan"}
            'HyperV' {$Arguments += " addHyperVPlan"}
            'MSSQL' {$Arguments += " addBackupMSSQLPlan"}
            Default {}
        }

        $Arguments += Set-Argument

        (Start-MBSProcess -CMDPath $CBB.CBBCLIPath -CMDArguments $Arguments -Output short -MasterPassword $MasterPassword).result
    }
    
    end {
        
    }
}
# SIG # Begin signature block
