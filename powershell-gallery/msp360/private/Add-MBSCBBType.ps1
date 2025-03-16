add-type -typedef @"
using System;
using System.Security;
using System.Net;
using System.Collections.Generic;

namespace MBS.Agent.Plan
{
    public abstract class BackupPlan {
        public string Name;
        public string ID;
        public string StorageAccount;
        public MBS.Agent.Plan.BackupPlanCommonOption BackupPlanCommonOption;
        public MBS.Agent.Plan.Schedule Schedule;
    }

    public abstract class NBFBackupPlan {
        public string Name;
        public string ID;
        public MBS.Agent.StorageAccount StorageAccount;
        public MBS.Agent.Plan.NBFBackupPlanCommonOption BackupPlanCommonOption;
        public MBS.Agent.Plan.NBFIncrementalSchedule Schedule;
        public MBS.Agent.Plan.NBFFullSchedule ForceFullSchedule;
    }

    public class BackupPlanCommonOption {
        public bool SyncRepositoryBeforeRun;
        public bool UseServerSideEncryption;
        public MBS.Agent.Plan.EncryptionAlgorithm EncryptionAlgorithm;
        public SecureString EncryptionPassword;
        public bool UseCompression;
        public MBS.Agent.Plan.StorageClass StorageClass;
        public bool SaveBackupPlanConfiguration;
        public TimeSpan StopIfPlanRunsFor;
        public bool RunMissedPlanImmediately;
        public string PreActionCommand;
        public Nullable<bool> PreActionContinueAnyway;
        public string PostActionCommand;
        public Nullable<bool> PostActionRunAnyway;
        public string BackupChainPlanID;
        public Nullable<bool> BackupChainExecuteOnlyAfterSuccess;
        public Nullable<bool> BackupChainExecuteForceFull;
        public MBS.Agent.Plan.Notification ResultEmailNotification;
        public MBS.Agent.Plan.Notification AddEventToWindowsLog;
        public Nullable<int> KeepVersionPeriod;
        public Nullable<int> KeepNumberOfVersion;
        public bool KeepLastVersion;
        public Nullable<int> DelayPurgePeriod;
    }

    public class NBFBackupPlanCommonOption {
        public bool SyncRepositoryBeforeRun;
        public bool UseServerSideEncryption;
        public MBS.Agent.Plan.EncryptionAlgorithm EncryptionAlgorithm;
        public SecureString EncryptionPassword;
        public bool UseCompression;
        public MBS.Agent.Plan.StorageClass StorageClass;
        public bool FullConsistencyCheck;
        public TimeSpan StopIfPlanRunsFor;
        public bool RunMissedPlanImmediately;
        public string PreActionCommand;
        public Nullable<bool> PreActionContinueAnyway;
        public string PostActionCommand;
        public Nullable<bool> PostActionRunAnyway;
        public string BackupChainPlanID;
        public Nullable<bool> BackupChainExecuteOnlyAfterSuccess;
        public Nullable<bool> BackupChainExecuteForceFull;
        public MBS.Agent.Plan.Notification ResultEmailNotification;
        public MBS.Agent.Plan.Notification AddEventToWindowsLog;
        public int KeepVersionPeriod;
        public int GFSKeepWeekly;
        public int GFSKeepMonthly;
        public int GFSKeepYearly;
        public MBS.Agent.Plan.Month GFSMonthOfTheYear;
        public bool ForeverForwardIncremental;
        public bool IntelligentRetention;
    }

    public class FileLevelBackupPlan : BackupPlan{
        public MBS.Agent.Plan.Schedule ForceFullSchedule;
        public bool UseBlockLevelBackup;
        public bool UseFastNTFSScan;
        public bool BackupNTFSPermissions;
        public bool ForceUsingVSS;
        public bool UseShareReadWriteModeOnError;
        public string DeleteLocallyDeletedFilesAfter;
        public bool BackupEmptyFolders;
        public string BackupOnlyAfter;
        public bool ExcludeSystemHiddenFiles;
        public string SkipFolder;
        public string IncludeFilesMask;
        public string ExcludeFilesMask;
        public bool IgnoreErrorPathNotFound;
        public bool TrackDeletedFiles;
        public System.Collections.Generic.List<string> BackupFile;
        public System.Collections.Generic.List<string> BackupDirectory;
        public System.Collections.Generic.List<string> ExcludeFile;
        public System.Collections.Generic.List<string> ExcludeDirectory;
        public bool GenerateDetailedReport;
    }  

    public class NBFFileLevelBackupPlan : NBFBackupPlan{
        public bool BackupNTFSPermissions;
        public bool FastNTFSScan;
        public bool ForceUsingVSS;
        public bool KeepEFSEncryption;
        public bool UseShareReadWriteModeOnError;
        public bool BackupEmptyFolders;
        public string BackupOnlyAfter;
        public bool ExcludeSystemHiddenFiles;
        public System.Collections.Generic.List<string> SkipFolder;
        public System.Collections.Generic.List<string> IncludeFilesMask;
        public System.Collections.Generic.List<string> ExcludeFilesMask;
        public bool IgnoreErrorPathNotFound;
        public System.Collections.Generic.List<string> BackupItem;
        public System.Collections.Generic.List<string> ExcludeItem;
        public bool GenerateDetailedReport;
    }  

    public class ImageBasedBackupPlan : BackupPlan {
        public MBS.Agent.Plan.Schedule ForceFullSchedule;
        public string BackupVolumes;
        public string[] Volumes;
        public bool disableVSS;
        public bool ignoreBadSectors;
        public bool useSystemVSS;
        public bool useSyntheticFull;
        public int prefetchBlockCount;
        public string blockSize;
        public string[] ExcludeItem;
        public bool KeepBitLocker;
        public string[] KeepBitLockerEnableForVolume;
        public string[] KeepBitLockerDisableForVolume;
    }

    public class NBFImageBasedBackupPlan : NBFBackupPlan {
        public MBS.Agent.Plan.BackupVolumeType BackupVolumes;
        public System.Collections.Generic.List<MBS.Agent.IBBVolume> Volumes;
        public bool DisableVSS;
        public bool IgnoreBadSectors;
        public bool UseSystemVSS;
        public Nullable<int> PrefetchBlockCount;
        public MBS.Agent.Plan.BlockSize BlockSize;
        public System.Collections.Generic.List<string> ExcludeItem;
        public bool KeepBitLocker;
        public System.Collections.Generic.List<string> KeepBitLockerEnableForVolume;
        public System.Collections.Generic.List<string> KeepBitLockerDisableForVolume;
        public MBS.Agent.Plan.RestoreVerificationMode RestoreVerificationMode;
    }

    public class NBFImageBasedBackupPlanCBB : NBFBackupPlan {
        public MBS.Agent.Plan.BackupVolumeType BackupVolumes;
        public System.Collections.Generic.List<MBS.Agent.IBBVolumeCBB> Volumes;
        public bool DisableVSS;
        public bool IgnoreBadSectors;
        public bool UseSystemVSS;
        public Nullable<int> PrefetchBlockCount;
        public MBS.Agent.Plan.BlockSize BlockSize;
        public MBS.Agent.Plan.RestoreVerificationMode RestoreVerificationMode;
    }

    public class HyperVBackupPlan : BackupPlan {
        public MBS.Agent.Plan.Schedule ForceFullSchedule;
        public string BackupVM;
        public string[] VirtualMachine;
    }

    public class MSSQLBackupPlan : BackupPlan {
        public MBS.Agent.Plan.Schedule DiffSchedule;
        public MBS.Agent.Plan.Schedule TLogSchedule;
        public string InstanceName;
        public bool useSSL;
        public bool useWinauth;
        public string UserName;
        public string Password;
        public string DBSelectionType;
        public string[] Databases;
        public bool CopyOnly;
        public bool Verify;
    }

    public class Schedule {
        public MBS.Agent.Plan.ScheduleFrequency Frequency;
        public Nullable<DateTime> At;
        public int DayOfMonth;
        public System.DayOfWeek[] DayOfWeek;
        public Nullable<MBS.Agent.Plan.WeekNumber> WeekNumber;
        public TimeSpan OccursFrom;
        public TimeSpan OccursTo;
        public TimeSpan OccursEvery;
        public int RepeatInterval;
        public DateTime RepeatStartDate;
    }

    public class NBFIncrementalSchedule {
        public MBS.Agent.Plan.NBFScheduleFrequency Frequency;
        public Nullable<DateTime> At;
        public int DayOfMonth;
        public System.DayOfWeek[] DayOfWeek;
        public Nullable<MBS.Agent.Plan.WeekNumber> WeekNumber;
        public TimeSpan OccursFrom;
        public TimeSpan OccursTo;
        public TimeSpan OccursEvery;
        public int RepeatInterval;
        public DateTime RepeatStartDate;
    }

    public class NBFFullSchedule {
        public MBS.Agent.Plan.NBFScheduleFrequency Frequency;
        public int DayOfMonth;
        public System.DayOfWeek[] DayOfWeek;
        public Nullable<MBS.Agent.Plan.WeekNumber> WeekNumber;
        public int RepeatInterval;
        public DateTime RepeatStartDate;
    }

    public class RestorePlanCommonOption {
        public bool SyncRepositoryBeforeRun;
        public SecureString EncryptionPassword;
        public TimeSpan StopIfPlanRunsFor;
        public string PreActionCommand;
        public Nullable<bool> PreActionContinueAnyway;
        public string PostActionCommand;
        public Nullable<bool> PostActionRunAnyway;
        public MBS.Agent.Plan.Notification ResultEmailNotification;
        public MBS.Agent.Plan.Notification AddEventToWindowsLog;
    }

    public enum WeekNumber
    {
        First,
        Second,
        Third,
        Fourth,
        Penultimate,
        Last
    }

    public enum RestoreVerificationMode
    {
        DoNotRun,
        RunForFull,
        RunForIncremental,
        RunForFullAndIncremental
    }

    public enum BlockSize
    {
        K1024 = 1024,
        K512 = 512,
        K256 = 256,
        K128 = 128
    }

    public enum Month
    {
        NotSet = 0,
        January = 1,
        February = 2,
        March = 3,
        April = 4,
        May = 5,
        June = 6,
        July = 7,
        August = 8,
        September = 9,
        October = 10,
        November = 11,
        December = 12
    }

    public enum DatabaseSelectionType
    {
        All,
        User,
        SelectedDB
    }

    public enum BackupVolumeType
    {
        AllVolumes,
        FixedVolumes,
        SystemRequired,
        SelectedVolumes
    }

    public enum BackupVMType
    {
        All,
        OnlyRunning,
        SelectedVM
    }

    public enum Period
    {
        day,
        week,
        month,
        year
    }

    public enum EncryptionAlgorithm
    {
        AES128,
        AES192,
        AES256
    }
    
    public enum StorageClass
    {
        Standard,
        IntelligentTiering,
        StandardIA,
        OneZoneIA,
        Glacier,
        GlacierInstantRetrieval,
        GlacierDeepArchive
    }

    public enum StorageClassCBB
    {
        STANDARD,
        INTELLIGENT_TIERING,
        STANDARD_IA,
        ONEZONE_IA,
        GLACIER,
        GLACIER_IR,
        DEEP_ARCHIVE
    }

    public enum Notification
    {
        off,
        errorOnly,
        on
    }

    public enum ScheduleFrequency
    {
        Once,
        Daily,
        Weekly,
        Monthly,
        DayofMonth,
        Realtime
    }

    public enum NBFScheduleFrequency
    {
        Daily,
        Weekly,
        Monthly,
        DayofMonth
    }

    public enum GlacierRestoreType
    {
        Expedited,
        Standard,
        Bulk
    }

    public enum RestoreVolumeType
    {
        AllVolumes,
        SelectedVolume
    }

    public enum VirtualDiskType
    {
        VHDdynamic,
        VHDfixed,
        VHDXdynamic,
        Raw,
        Rawsparse,
        Tar,
        Tgz,
        VDIdynamic,
        VDIfixed,
        VMDKdynamic,
        VMDKfixed
    }
}

namespace MBS.Agent
{
    public class License {
        public string User;
        public string ID;
    }

    public class StorageAccount {
        public string ID;
        public string Type;
        public string SGCloudTypeValue;
        public string BackupPath;
        public string Bucket;
        public string BucketID;
        public string DisplayName;
        public bool ForceSharing;
        public bool IsRestoreOnly;
        public string SGAccountID;
        public string SGEndPoint;
        public string SGFolderPath;
        public string SGHttpsEndPoint;
        public int SignatureVersion;
        public string Path;
        public bool UseSSL;
    }

    public class StorageAccountContent {
        public MBS.Agent.StorageAccountContentType Type; 
        public string Name;
        public string FullName;
        public Nullable<DateTime> Date;
        public long Size;
        public bool IsCompressed; 
        public bool IsEncrypted; 
        public FileVersions[] Versions;
    }

    public class TestStorageAccountResult {
        public string Name;
        public string HostName;
        public int RemotePort;
        public IPAddress RemoteAddress;
        public bool TestSucceeded; 
    }

    public class FileVersions {
        public DateTime Date; 
        public long Size; 
        public bool IsCompressed; 
        public bool IsEncrypted; 

    }
    public enum StorageAccountContentType
    {
        Folder,
        File,
        Disk
    }

    public class CLIResult
    {
        public string[] Result;
        public string[] Warnings;
        public string[] Errors;
    }

    public class CLIRawResult
    {
        public string stdout;
        public string stderr;
        public int ExitCode;
    }

    public class IBBBackup
    {
        public string Name;
        public DateTime DateUTC;
        public string Type;
        public bool Encrypted;
        public MBS.Agent.IBBBackupDisk[] Disks;
    }

    public class IBBBackupDisk : IBBDisk
    {
        public string BackupType;
        public Nullable<DateTime> Date;
    }

    public class IBBDisk
    {
        public int Disk;
        public string Type;
        public long Capacity;
        public string Model;
        public string Id;
        public System.Collections.Generic.List<MBS.Agent.IBBVolume> Volumes;
    }

    public class IBBDiskV6
    {
        public int DiskNumber;
        public string DriveType;
        public long Capacity;
        public string Model;
        public string DiskId;
        public System.Collections.Generic.List<MBS.Agent.IBBVolumeV6> Volumes;
    }

    public class IBBVolume
    {
        public string[] MountPoints;
        public bool Supported;
        public bool RequiredBySystem;
        public string DriveType;
        public string FileSystemType;
        public string WindowsVolumeIdentity;
        public long Length;
        public long UsedSpace;
        public string Label;
        public bool IsBoot;
        public bool IsActive;
        public Nullable<bool> IsBitLocker;
    }

    public class IBBVolumeCBB : IBBVolume
    {
        public MBS.Agent.IBBVolumeBackupOptionsCBB BackupOptions;
    }

    public class IBBVolumeBackupOptionsCBB
    {
        public bool UseVss;
        public System.Collections.Generic.List<MBS.Agent.IBBVolumeBackupOptionsExcludeRulesCBB> ExcludeRules;
        public bool KeepBitLocker;
    }

    public class IBBVolumeBackupOptionsExcludeRulesCBB
    {
        public string Folder;
        public string Mask;
        public bool Recursive;
        public bool DeleteFolder;
    }

    public class IBBVolumeV6
    {
        public string[] MountPoints;
        public bool Supported;
        public bool RequiredBySystem;
        public string DriveType;
        public string FileSystemType;
        public string WindowsVolumeIdentity;
        public long Length;
        public long UsedSpace;
    }
}

namespace MBS.PSModule
{
    public class Settings
    {
        public string CBBPath;
        public string CBBProgramData;
        public bool SkipEngineSettingsListCheck;
        public bool SkipCompression;
        public bool SkipEncryption;
        public bool SkipStorageClass;
        public bool SkipSSE;
        public bool SkipVSS;
    }
}

"@
# SIG # Begin signature block
