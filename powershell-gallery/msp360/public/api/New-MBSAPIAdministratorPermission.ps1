function New-MBSAPIAdministratorPermission {
    <#
    .SYNOPSIS
    Creates MBS.API.AdministratorPermission type object.
    
    .DESCRIPTION
    Returns AdministratorPermission type object 
    
    .PARAMETER Users
    Permission for manage users

    .PARAMETER StorageLimit
    Permission for manage storage limit

    .PARAMETER Notification
    Permission for manage notification

    .PARAMETER OnlineAccess
    Permission for manage Online Access

    .PARAMETER Licenses
    Permission for manage Licenses

    .PARAMETER Billing
    Permission for manage billing

    .PARAMETER Monitiring
    Permission for manage monitoring

    .PARAMETER RemoteDeploy
    Permission for manage remote deploy

    .PARAMETER RemoteManagment
    Permission for manage remote management

    .PARAMETER HelpMarketing
    Permission for marketing and help

    .PARAMETER AuditLog
    Permission for manage AuditLog

    .PARAMETER PSA
    Permission for manage connectwise and autotask

    .PARAMETER Administrators
    Permission for manage administrators

    .PARAMETER Rebranding
    Permission for manage rebranding

    .PARAMETER Storage
    Permission for manage storages

    .PARAMETER ADS
    Permission for manage AD Bridge

    .PARAMETER LicenseBuy
    Permission for buy licenses

    .PARAMETER LicenseActivate
    Permission for activate licenses

    .PARAMETER StorageUsage
    Permission for storage usages

    .PARAMETER CapacityReport
    Permission for capacity report

    .PARAMETER GoogleApps
    Permission for manage google apps

    .PARAMETER Dashboard
    Permission for dashboard

    .PARAMETER Downloads
    Show Downloads

    .PARAMETER CloudRestore
    Manage Cloud Restore

    .PARAMETER EC2Snapshots
    Manage EC2 Snapshots

    .PARAMETER LicenseUsageHistory
    License Usage History

    .PARAMETER BackupHistory
    Backup History

    .PARAMETER PurchaseHistory
    Purchase History

    .PARAMETER UsersCreateEdit
    Allowed to Create and Edit Users

    .PARAMETER UsersDelete
    Allowed to Delete Users

    .PARAMETER ManageCompanies
    Allowed to Manage companies

    .PARAMETER ManageImmutability
    Allowed to Manage immutability

    .PARAMETER EnableUndefinedPermissions
    If set, all undefined permissions will be enabled (by default, undefined permissions are disabled)
    
    .EXAMPLE
        New-MBSAPIAdministratorPermission -Notification Access -RemoteManagement Access -Downloads Access -BackupHistory Access
    
        Create object with administrator permissions that allow only to manage notifications, remote management, downloads, and backup history.

    .EXAMPLE
        New-MBSAPIAdministratorPermission -Administrators None -Licenses None -LicenseBuy None -LicenseActivate None -LicenseUsageHistory None -EnableUndefinedPermissions

        Create object with administrator permissions that enables all permissions except managing administrators and all actions related to licenses.

    .EXAMPLE
        New-MBSAPIAdministratorPermission -EnableUndefinedPermissions

        Create object with administrator permissions that enables all permissions

    .INPUTS
        None

    .OUTPUTS
        MBS.API.AdministratorPermission

    .NOTES
        Author: MSP360 Onboarding Team

    .LINK
        https://mspbackups.com/AP/Help/powershell/cmdlets/api/new-mbsapiadministratorpermission
    #>

    [CmdletBinding()]
    param (
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage users")]
        [MBS.API.AdministratorPermissionMode]$Users,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage storage limit")]
        [MBS.API.AdministratorPermissionMode]$StorageLimit,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage notification")]
        [MBS.API.AdministratorPermissionMode]$Notification,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage Online Access")]
        [MBS.API.AdministratorPermissionMode]$OnlineAccess,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage Licenses")]
        [MBS.API.AdministratorPermissionMode]$Licenses,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage billing")]
        [MBS.API.AdministratorPermissionMode]$Billing,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage monitoring")]
        [MBS.API.AdministratorPermissionMode]$Monitiring,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage remote deploy")]
        [MBS.API.AdministratorPermissionMode]$RemoteDeploy,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage remote management")]
        [MBS.API.AdministratorPermissionMode]$RemoteManagment,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for marketing and help")]
        [MBS.API.AdministratorPermissionMode]$HelpMarketing,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage AuditLog")]
        [MBS.API.AdministratorPermissionMode]$AuditLog,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage connectwise and autotask")]
        [MBS.API.AdministratorPermissionMode]$PSA,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage administrators")]
        [MBS.API.AdministratorPermissionMode]$Administrators,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage rebranding")]
        [MBS.API.AdministratorPermissionMode]$Rebranding,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage storages")]
        [MBS.API.AdministratorPermissionMode]$Storage,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage AD Bridge")]
        [MBS.API.AdministratorPermissionMode]$ADS,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for buy licenses")]
        [MBS.API.AdministratorPermissionMode]$LicenseBuy,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for activate licenses")]
        [MBS.API.AdministratorPermissionMode]$LicenseActivate,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for storage usages")]
        [MBS.API.AdministratorPermissionMode]$StorageUsage,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for capacity report")]
        [MBS.API.AdministratorPermissionMode]$CapacityReport,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for manage google apps")]
        [MBS.API.AdministratorPermissionMode]$GoogleApps,
        #
        [Parameter(Mandatory=$false, HelpMessage="Permission for dashboard")]
        [MBS.API.AdministratorPermissionMode]$Dashboard,
        #
        [Parameter(Mandatory=$false, HelpMessage="Show Downloads")]
        [MBS.API.AdministratorPermissionMode]$Downloads,
        #
        [Parameter(Mandatory=$false, HelpMessage="Manage Cloud Restore")]
        [MBS.API.AdministratorPermissionMode]$CloudRestore,
        #
        [Parameter(Mandatory=$false, HelpMessage="Manage EC2 Snapshots")]
        [MBS.API.AdministratorPermissionMode]$EC2Snapshots,
        #
        [Parameter(Mandatory=$false, HelpMessage="License Usage History")]
        [MBS.API.AdministratorPermissionMode]$LicenseUsageHistory,
        #
        [Parameter(Mandatory=$false, HelpMessage="Backup History")]
        [MBS.API.AdministratorPermissionMode]$BackupHistory,
        #
        [Parameter(Mandatory=$false, HelpMessage="Purchase History")]
        [MBS.API.AdministratorPermissionMode]$PurchaseHistory,
        #
        [Parameter(Mandatory=$false, HelpMessage="Allowed to Create and Edit Users")]
        [MBS.API.AdministratorPermissionMode]$UsersCreateEdit,
        #
        [Parameter(Mandatory=$false, HelpMessage="Allowed to Delete Users")]
        [MBS.API.AdministratorPermissionMode]$UsersDelete,
        #
        [Parameter(Mandatory=$false, HelpMessage="Allowed to Manage companies")]
        [MBS.API.AdministratorPermissionMode]$ManageCompanies,
        #
        [Parameter(Mandatory=$false, HelpMessage="Allowed to Manage immutability")]
        [MBS.API.AdministratorPermissionMode]$ManageImmutability,
        #
        [Parameter(Mandatory=$false, HelpMessage="If set, all undefined permissions will be enabled (by default, undefined permissions are disabled)")]
        [switch]$EnableUndefinedPermissions
    )

    begin {

    }

    process {
        $AdministratorPermissions = New-Object -TypeName MBS.API.AdministratorPermission
        ForEach ($Property in ($AdministratorPermissions | Get-Member -MemberType Property).Name) {
            if ($EnableUndefinedPermissions) {
                $AdministratorPermissions.$Property = 'Access'
            }
        }
        if($null -ne $KeepVersionPeriod){$BackupPlanOption.KeepVersionPeriod = $KeepVersionPeriod}

        if($null -ne $Users) {$AdministratorPermissions.Users = $Users}
        if($null -ne $StorageLimit) {$AdministratorPermissions.StorageLimit = $StorageLimit}
        if($null -ne $Notification) {$AdministratorPermissions.Notification = $Notification}
        if($null -ne $OnlineAccess) {$AdministratorPermissions.OnlineAccess = $OnlineAccess}
        if($null -ne $Licenses) {$AdministratorPermissions.Licenses = $Licenses}
        if($null -ne $Billing) {$AdministratorPermissions.Billing = $Billing}
        if($null -ne $Monitiring) {$AdministratorPermissions.Monitiring = $Monitiring}
        if($null -ne $RemoteDeploy) {$AdministratorPermissions.RemoteDeploy = $RemoteDeploy}
        if($null -ne $RemoteManagment) {$AdministratorPermissions.RemoteManagment = $RemoteManagment}
        if($null -ne $HelpMarketing) {$AdministratorPermissions.HelpMarketing = $HelpMarketing}
        if($null -ne $AuditLog) {$AdministratorPermissions.AuditLog = $AuditLog}
        if($null -ne $PSA) {$AdministratorPermissions.PSA = $PSA}
        if($null -ne $Administrators) {$AdministratorPermissions.Administrators = $Administrators}
        if($null -ne $Rebranding) {$AdministratorPermissions.Rebranding= $Rebranding}
        if($null -ne $Storage) {$AdministratorPermissions.Storage = $Storage}
        if($null -ne $ADS) {$AdministratorPermissions.ADS = $ADS}
        if($null -ne $LicenseBuy) {$AdministratorPermissions.LicenseBuy = $LicenseBuy}
        if($null -ne $LicenseActivate) {$AdministratorPermissions.LicenseActivate = $LicenseActivate}
        if($null -ne $StorageUsage) {$AdministratorPermissions.StorageUsage = $StorageUsage}
        if($null -ne $CapacityReport) {$AdministratorPermissions.CapacityReport = $CapacityReport}
        if($null -ne $GoogleApps) {$AdministratorPermissions.GoogleApps = $GoogleApps}
        if($null -ne $Dashboard) {$AdministratorPermissions.Dashboard = $Dashboard}
        if($null -ne $Downloads) {$AdministratorPermissions.Downloads = $Downloads}
        if($null -ne $CloudRestore) {$AdministratorPermissions.CloudRestore = $CloudRestore}
        if($null -ne $EC2Snapshots) {$AdministratorPermissions.EC2Snapshots = $EC2Snapshots}
        if($null -ne $LicenseUsageHistory) {$AdministratorPermissions.LicenseUsageHistory = $LicenseUsageHistory}
        if($null -ne $BackupHistory) {$AdministratorPermissions.BackupHistory = $BackupHistory}
        if($null -ne $PurchaseHistory) {$AdministratorPermissions.PurchaseHistory = $PurchaseHistory}
        if($null -ne $UsersCreateEdit) {$AdministratorPermissions.UsersCreateEdit = $UsersCreateEdit}
        if($null -ne $UsersDelete) {$AdministratorPermissions.UsersDelete = $UsersDelete}
        if($null -ne $ManageCompanies) {$AdministratorPermissions.ManageCompanies = $ManageCompanies}
        if($null -ne $ManageImmutability) {$AdministratorPermissions.ManageImmutability = $ManageImmutability}

        return $AdministratorPermissions
    }
    
    end {
        
    }
}
# SIG # Begin signature block
