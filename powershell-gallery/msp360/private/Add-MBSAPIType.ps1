add-type -typedef @"
using System;
using System.Security;

namespace MBS.API
{
    public class License {
        public string ID;
        public long Number;
        public string ComputerName;
        public string OperatingSystem;
        public bool IsTrial;
        public bool IsTaken;
        public string LicenseType;
        public DateTime DateExpired;
        public string Transaction;
        public string User;
        public string UserID;
    }

    public class User {
        public string ID;
        public string Email;
        public string FirstName;
        public string LastName;
        public string[] NotificationEmails;
        public string Company;
        public bool Enabled;
        public MBS.API.UserLicensingMode LicenseManagmentMode;
        public MBS.API.UserDestination[] DestinationList;
        public long SpaceUsed;
    }

    public class UserDestination {
        public string ID;
        public long CurrentVolume;
        public long PackageID;
        public string AccountID;
        public string AccountDisplayName;
        public string Destination;
        public string DestinationDisplayName;
    }

    public class UserComputer {
        public string DestinationId;
        public string ComputerName;
    }

    public class Company {
        public string ID;
        public string Name;
        public long StorageLimit;
        public string LicenseSettings;
        public MBS.API.CompanyDestination[] Destinations;
    }

    public class CompanyDestination {
        public string DestinationId;
    }

    public class BuildModels {
        public string Type;
        public string Version;
        public string DownloadLink;
    }

    public class RequestBuilds {
        public MBS.API.BuildEdition[] Editions;
        public MBS.API.BuildType Type;
    }

    public class Monitoring {
        public string PlanName;
        public string CompanyName;
        public string UserName;
        public string UserID;
        public string ComputerName;
        public string BuildVersion;
        public string StorageType;
        public Nullable<DateTime> LastStart;
        public Nullable<DateTime> NextStart;
        public MBS.API.MonitoringPlanStatus Status;
        public string ErrorMessage;
        public long FilesCopied;
        public long FilesFailed;
        public long DataCopied;
        public string Duration;
        public long DataToBackup;
        public long TotalData;
        public long FilesScanned;
        public long FilesToBackup;
        public string PlanId;
        public MBS.API.MonitoringPlanType PlanType;
        public string DetailedReportLink;
    }

    public class Administrator {
        public string AdminID;
        public string Email;
        public string FirstName;
        public string LastName;
        public bool Enabled;
        public MBS.API.AdministratorPermission PermissionsModels;
        public Nullable<DateTime> LastLogin;
        public DateTime DateCreated;
        public string[] Companies;
        public MBS.API.AccessToCompaniesMode AccessToCompaniesMode;
        public MBS.API.AdministratorAccountType AccountType;
    }

    public class AdministratorPermission {
        public MBS.API.AdministratorPermissionMode Users;
        public MBS.API.AdministratorPermissionMode StorageLimit;
        public MBS.API.AdministratorPermissionMode Notification;
        public MBS.API.AdministratorPermissionMode OnlineAccess;
        public MBS.API.AdministratorPermissionMode Licenses;
        public MBS.API.AdministratorPermissionMode Billing;
        public MBS.API.AdministratorPermissionMode Monitiring;
        public MBS.API.AdministratorPermissionMode RemoteDeploy;
        public MBS.API.AdministratorPermissionMode RemoteManagment;
        public MBS.API.AdministratorPermissionMode HelpMarketing;
        public MBS.API.AdministratorPermissionMode AuditLog;
        public MBS.API.AdministratorPermissionMode PSA;
        public MBS.API.AdministratorPermissionMode Administrators;
        public MBS.API.AdministratorPermissionMode Rebranding;
        public MBS.API.AdministratorPermissionMode Storage;
        public MBS.API.AdministratorPermissionMode ADS;
        public MBS.API.AdministratorPermissionMode LicenseBuy;
        public MBS.API.AdministratorPermissionMode LicenseActivate;
        public MBS.API.AdministratorPermissionMode StorageUsage;
        public MBS.API.AdministratorPermissionMode CapacityReport;
        public MBS.API.AdministratorPermissionMode GoogleApps;
        public MBS.API.AdministratorPermissionMode Dashboard;
        public MBS.API.AdministratorPermissionMode Downloads;
        public MBS.API.AdministratorPermissionMode CloudRestore;
        public MBS.API.AdministratorPermissionMode EC2Snapshots;
        public MBS.API.AdministratorPermissionMode LicenseUsageHistory;
        public MBS.API.AdministratorPermissionMode BackupHistory;
        public MBS.API.AdministratorPermissionMode PurchaseHistory;
        public MBS.API.AdministratorPermissionMode UsersCreateEdit;
        public MBS.API.AdministratorPermissionMode UsersDelete;
        public MBS.API.AdministratorPermissionMode ManageCompanies;
        public MBS.API.AdministratorPermissionMode ManageImmutability;
    }

    public class Destination1 {
        public string ID;
        public int CurrentVolume;
        public int PackageID;
        public string AccountID;
        public string AccountDisplayName;
        public string Destination;
        public string DestinationDisplayName;
    }

    public class StorageAccount {
        public string ResellerAccountID;
        public string AccountID;
        public DateTime DateCreated;
        public string DisplayName;
        public string StorageType;
        public MBS.API.StorageAccountDestination[] Destinations;
    }

    public class StorageAccountDestination {
        public string DestinationID;
        public string AccountID;
        public string Destination;
        public string DestinationDisplayName;
    }

    public class Billing {
        public long CurrentSpaceUsed;
        public long AverageSpaceUsed;
        public long TotalRestore;
        public MBS.API.BillingStatistic[] StatisticBilling;
    }

    public class BillingStatistic {
        public string UserId;
        public string Email;
        public string FirstName;
        public string LastName;
        public string CompanyName;
        public long AverageSpace;
        public long TotalVolumeRestore;
        public Decimal PlanCost;
        public Decimal StorageCost;
        public Decimal RestoreCost;
        public Decimal TotalCost;
    }

    public class BillingDetails {
        public long TotalBackupBytes;
        public long TotalRestoreBytes;
        public string UserID;
        public MBS.API.BillingUserDetailList[] UserDetailList;
    }

    public class BillingUserDetailList {
        public string Computer;
        public long SizeBackup;
        public long SizeRestore;
        public string Prefix;
        public string AccountID;
        public string Destination;
    }

    public class StoragePackage {
        public long ID;
        public Decimal Cost;
        public string Description;
        public bool Enabled;
        public string Name;
        public Decimal StorageLimit;
        public bool isGlacierRestoreLimit;
        public Decimal RestoreLimit;
        public MBS.API.GlacierRestoreType GlacierRestoreType;
        public bool UseRestoreLimit;
    }

    public class StorageAccountSetting {
        public string DisplayName;
        public MBS.API.StorageAccountType Type;
        public string AccountSettings;
    }

    public abstract class AmazonS3Like {
        public string AccessKey;
        public string SecretKey;
    }

    public abstract class S3CompatibleLike : AmazonS3Like {
        public string HTTPEnpoint;
        public string HTTPSEndpoint;
        public bool IgnoreCertificate;
        public bool NotCheckCredentials;
    }

    public class Wasabi : AmazonS3Like{ }

    public class Minio : S3CompatibleLike { }

    public class S3Compatible : S3CompatibleLike {
        public bool UseNativeMultipartUpload;
        public MBS.API.SignatureVersion SignatureVersion;
        public bool IsGovCloud;
    }

    public class AmazonS3 : AmazonS3Like{
        public bool IsGovCloud;
    }

    public class GoogleCloudPlatform {
        public string ServiceAccountEmail;
        public string BinaryKeyAsBase64;
        public string ProjectID;
    }

    public class Azure {
        public string AccountName;
        public string SharedKey;
    }

    public class OpenStackCompatible {
        public string UserName;
        public string ApiKey;
        public string AuthService;
        public MBS.API.KeyStoneType KeyStoneVersion;
        public MBS.API.OpenStackType TenantType;
        public string Tenant;
        public bool UseInternalURLs;
        public MBS.API.OpenStackType DomainType;
        public string Domain;
        public bool UseScope;
        public MBS.API.OpenStackType ProjectType;
        public string Project;
    }

    public class OpenStack : OpenStackCompatible{
        public string IgnoreCertificate;
        public string NotCheckCredentials;
    }

    public class FS {
        public string Login;
        public string Pass;
        public string Path;
    }

    public enum GlacierRestoreType
    {
        Standard,
        Bulk,
        Expedited,
        No
    }

    public enum AdministratorPermissionMode
    {
        None,
        Access
    }

    public enum UserLicensingMode
    {
        Manual,
        Automatic,
        CompanySettings
    }

    public enum CompanyLicensingMode
    {
        CustomUsersSettings,
        GlobalLicensesPool,
        CompanyLicensesPool
    }

    public enum BuildEdition
    {
        Windows,
        VirtualMachine,
        MacOS,
        LinuxDeb,
        LinuxRpm,
        DedupServer
    }

    public enum BuildType
    {
        Custom,
        Sandbox
    }

    public enum MonitoringPlanType
    {
        NA,
        Backup,
        Restore,
        BackupFiles,
        RestoreFiles,
        VMBackup,
        VMRestore,
        SQLBackup,
        SQLResore,
        ExchangeBackup,
        ExchangeRestore,
        BMSSBackup,
        BMSSRestore,
        ConsistencyCheck,
        EC2Backup,
        EC2Restore,
        HyperVBackup,
        HyperVRestore
    }

    public enum MonitoringPlanStatus
    {
        Success,
        Overdue,
        Error,
        Running,
        Unknown,
        Interrupted,
        UnexpectedlyClosed,
        Warning
    }

    public enum StorageAccountType
    {
        AmazonS3,
        AmazonS3China,
        Azure,
        OpenStack,
        OracleCloud,
        S3Compatible,
        Scality,
        CenturyLink,
        ArubaCloud,
        BackblazeB2,
        Cloudian,
        Connectria,
        Constant,
        DreamObjects,
        Dunkel,
        GreenQloud,
        HostEurope,
        Seeweb,
        ThinkOn,
        Tiscali,
        Walrus,
        FS,
        GoogleCloudPlatform,
        Wasabi,
        Minio
    }

    public enum KeyStoneType
    {
        DoNotUse,
        Two,
        Three
    }

    public enum OpenStackType
    {
        Name,
        ID
    }

    public enum SignatureVersion
    {
        Version2 = 2,
        Version4 = 4
    }

    public enum AccessToCompaniesMode
    {
        SpecifiedCompanies,
        AllCompanies
    }

    public enum AdministratorAccountType
    {
        Undefined,
        InternalAccount,
        ExternalAccount
    }
}
"@
# SIG # Begin signature block
