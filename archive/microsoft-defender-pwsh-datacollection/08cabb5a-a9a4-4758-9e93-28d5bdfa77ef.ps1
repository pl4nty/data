# Remove pre loaded modules to mitigate exploit
Get-Module | ForEach-Object { Remove-Module -Name $_.Name -Force }
$PSModuleAutoloadingPreference = 'none'
Import-Module Microsoft.PowerShell.Utility

[string]$ScriptName = "AllowedLocalRightUsersCollector"
[string]$ScriptVersion = "V3.1.1"
[array]$UserRights = @(
    "SeRemoteInteractiveLogonRight",
    "SeInteractiveLogonRight",
    "SeNetworkLogonRight",
    "SeDebugPrivilege",
    "SeBatchLogonRight",
    "SeServiceLogonRight"
)
[hashtable]$DeniableRights = @{
    SeRemoteInteractiveLogonRight = "SeDenyRemoteInteractiveLogonRight";
    SeInteractiveLogonRight = "SeDenyInteractiveLogonRight";
    SeNetworkLogonRight = "SeDenyNetworkLogonRight";
    SeBatchLogonRight = "SeDenyBatchLogonRight";
    SeServiceLogonRight = "SeDenyServiceLogonRight";
}

$EtwWriter = @"
using System;
using System.Text;
using System.Diagnostics.Tracing;
using Microsoft.PowerShell.Commands;


[EventSource(Name = "Microsoft.Windows.Sense.Tvm.Collector", Guid = "26a5f8cc-b64b-5f0b-8916-563a101426b4")]
public sealed class TvmEventSource : EventSource
{
    public TvmEventSource() : base(EventSourceSettings.EtwSelfDescribingEventFormat | EventSourceSettings.ThrowOnEventWriteErrors) { }
}

[EventData]
public class AllowedLocalRightUsersCollectorEvent
{
    public string UserRight  {get; set;}
    public string IdentitiesJson  {get; set;}
    public string MachineSID  {get; set;}
    public string DomainSID {get; set;}
}
"@

$LSAUtility = @'
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Security;
using System.Security.Principal;
using System.Text;

using LSA_HANDLE = System.IntPtr;

namespace LSAUtility
{
    // Structs and enums
    public enum SIDNameUse
    {
        SidTypeUser = 1,
        SidTypeGroup,
        SidTypeDomain,
        SidTypeAlias,
        SidTypeWellKnownGroup,
        SidTypeDeletedAccount,
        SidTypeInvalid,
        SidTypeUnknown,
        SidTypeComputer,
        SidTypeLabel,
        SidTypeLogonSession
    }

    public enum Rights
    {
        SeTrustedCredManAccessPrivilege, // Access Credential Manager as a trusted caller
        SeNetworkLogonRight, // Access this computer from the network
        SeTcbPrivilege, // Act as part of the operating system
        SeMachineAccountPrivilege, // Add workstations to domain
        SeIncreaseQuotaPrivilege, // Adjust memory quotas for a process
        SeInteractiveLogonRight, // Allow log on locally
        SeRemoteInteractiveLogonRight, // Allow log on through Remote Desktop Services
        SeBackupPrivilege, // Back up files and directories
        SeChangeNotifyPrivilege, // Bypass traverse checking
        SeSystemtimePrivilege, // Change the system time
        SeTimeZonePrivilege, // Change the time zone
        SeCreatePagefilePrivilege, // Create a pagefile
        SeCreateTokenPrivilege, // Create a token object
        SeCreateGlobalPrivilege, // Create global objects
        SeCreatePermanentPrivilege, // Create permanent shared objects
        SeCreateSymbolicLinkPrivilege, // Create symbolic links
        SeDebugPrivilege, // Debug programs
        SeDenyNetworkLogonRight, // Deny access this computer from the network
        SeDenyBatchLogonRight, // Deny log on as a batch job
        SeDenyServiceLogonRight, // Deny log on as a service
        SeDenyInteractiveLogonRight, // Deny log on locally
        SeDenyRemoteInteractiveLogonRight, // Deny log on through Remote Desktop Services
        SeEnableDelegationPrivilege, // Enable computer and user accounts to be trusted for delegation
        SeRemoteShutdownPrivilege, // Force shutdown from a remote system
        SeAuditPrivilege, // Generate security audits
        SeImpersonatePrivilege, // Impersonate a client after authentication
        SeIncreaseWorkingSetPrivilege, // Increase a process working set
        SeIncreaseBasePriorityPrivilege, // Increase scheduling priority
        SeLoadDriverPrivilege, // Load and unload device drivers
        SeLockMemoryPrivilege, // Lock pages in memory
        SeBatchLogonRight, // Log on as a batch job
        SeServiceLogonRight, // Log on as a service
        SeSecurityPrivilege, // Manage auditing and security log
        SeRelabelPrivilege, // Modify an object label
        SeSystemEnvironmentPrivilege, // Modify firmware environment values
        SeManageVolumePrivilege, // Perform volume maintenance tasks
        SeProfileSingleProcessPrivilege, // Profile single process
        SeSystemProfilePrivilege, // Profile system performance
        SeUnsolicitedInputPrivilege, // "Read unsolicited input from a terminal device"
        SeUndockPrivilege, // Remove computer from docking station
        SeAssignPrimaryTokenPrivilege, // Replace a process level token
        SeRestorePrivilege, // Restore files and directories
        SeShutdownPrivilege, // Shut down the system
        SeSyncAgentPrivilege, // Synchronize directory service data
        SeTakeOwnershipPrivilege // Take ownership of files or other objects
    }

    internal enum LocalgroupMembersInfoStruct : uint
    {
        LOCALGROUP_MEMBERS_INFO_0 = 0, // SID
        LOCALGROUP_MEMBERS_INFO_1, // SID, SID Usage, Name
        LOCALGROUP_MEMBERS_INFO_2, // SID, SID Usage, DomainAndName
        LOCALGROUP_MEMBERS_INFO_3, // DomainAndName
    }


    [StructLayout(LayoutKind.Sequential)]
    internal struct LsaObjectAttributes
    {
        internal int Length;
        internal IntPtr RootDirectory;
        internal IntPtr ObjectName;
        internal int Attributes;
        internal IntPtr SecurityDescriptor;
        internal IntPtr SecurityQualityOfService;
    }

    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    internal struct LsaUnicodeString
    {
        internal ushort Length;
        internal ushort MaximumLength;
        [MarshalAs(UnmanagedType.LPWStr)] internal string Buffer;
    }

    [StructLayout(LayoutKind.Sequential)]
    internal struct LsaEnumerationInformation
    {
        internal IntPtr PSid;
    }

    [StructLayout(LayoutKind.Sequential)]
    internal struct LsaTranslatedName
    {
        internal SIDNameUse Use;
        internal LsaUnicodeString Name;
        internal int DomainIndex;
    }

    [StructLayout(LayoutKind.Sequential)]
    internal struct LsaTrustInformation
    {
        internal LsaUnicodeString Name;
        internal IntPtr Sid;
    }

    [StructLayout(LayoutKind.Sequential)]
    internal struct LsaReferencedDomainList
    {
        internal uint Entries;
        internal IntPtr Domains;
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct Principal
    {
        public string Name;
        public SIDNameUse SidType;
        public string DomainName;
        public SecurityIdentifier Sid;
    }

    [StructLayout(LayoutKind.Sequential)]
    internal struct LOCALGROUP_MEMBERS_INFO_0
    {
        internal IntPtr PSid;
    }

    // Helper classes
    public sealed class HelperMethods
    {
        public static Exception InformativeException(string methodName, int win32ErrorCode = -1, string customMessage = "")
        {
            if (win32ErrorCode >= 0)
            {
                return new Exception(string.Format("Error ({0}) while executing {1}: \n{2}\n", win32ErrorCode, methodName, customMessage),
                    new Win32Exception(win32ErrorCode));
            }

            return new Exception(string.Format("Error while executing {0}: \n{1}\n", methodName, customMessage));
        }
    }

    internal sealed class NativeMethods
    {



        // Net native functions
        [DllImport("netapi32.dll")]
        public static extern void NetApiBufferFree(IntPtr bufptr);

        [DllImport("Netapi32.dll")]
        public extern static uint NetLocalGroupGetMembers([MarshalAs(UnmanagedType.LPWStr)] String servername,
            [MarshalAs(UnmanagedType.LPWStr)] String localgroupname, uint level, ref IntPtr bufptr, uint prefmaxlen,
            ref uint entriesread, ref uint totalentries, IntPtr resumehandle);

        // LSA native functions
        [DllImport("advapi32", CharSet = CharSet.Unicode, SetLastError = true), SuppressUnmanagedCodeSecurityAttribute]
        internal static extern uint LsaOpenPolicy(
            LsaUnicodeString[] systemName,
            ref LsaObjectAttributes objectAttributes,
            int accessMask,
            out IntPtr policyHandle);

        [DllImport("advapi32", CharSet = CharSet.Unicode, SetLastError = true), SuppressUnmanagedCodeSecurityAttribute]
        internal static extern uint LsaEnumerateAccountsWithUserRight(
            LSA_HANDLE policyHandle,
            LsaUnicodeString[] userRights,
            out IntPtr enumerationBuffer,
            out ulong countReturned);

        [DllImport("advapi32", CharSet = CharSet.Unicode, SetLastError = true), SuppressUnmanagedCodeSecurityAttribute]
        internal static extern bool LookupAccountSid(
            [MarshalAs(UnmanagedType.LPWStr)] string lpSystemName,
            [MarshalAs(UnmanagedType.LPArray)] byte[] sid,
            [MarshalAs(UnmanagedType.LPWStr)] System.Text.StringBuilder lpName,
            ref uint cchName,
            [MarshalAs(UnmanagedType.LPWStr)] System.Text.StringBuilder referencedDomainName,
            ref uint cchReferencedDomainName,
            out SIDNameUse peUse);

        [DllImport("advapi32")]
        internal static extern int LsaNtStatusToWinError(int ntStatus);

        [DllImport("advapi32")]
        internal static extern int LsaClose(IntPtr policyHandle);

        [DllImport("advapi32")]
        internal static extern int LsaFreeMemory(IntPtr buffer);



    }

    public static class NetApiUtils
    {
        private const uint ERROR_NO_SUCH_ALIAS = 0x80004005;

        public static IEnumerable<SecurityIdentifier> GetLocalGroupUsers(String localGroupName)
        {
            IntPtr bufPtr = IntPtr.Zero;
            List<SecurityIdentifier> sidList = new List<SecurityIdentifier>();
            try
            {

                uint entriesRead = 0;
                uint totalEntries = 0;
                uint result = NativeMethods.NetLocalGroupGetMembers(null, localGroupName,
                    (uint)LocalgroupMembersInfoStruct.LOCALGROUP_MEMBERS_INFO_0, ref bufPtr, uint.MaxValue,
                    ref entriesRead, ref totalEntries, IntPtr.Zero);
                if (result != 0)
                {
                    // Group does not exist
                    if (result == ERROR_NO_SUCH_ALIAS)
                    {
                        return sidList;
                    }

                    throw HelperMethods.InformativeException(MethodBase.GetCurrentMethod().Name, (int)result);
                }

                if (entriesRead > 0)
                {
                    for (int i = 0; i < entriesRead; i++)
                    {
                        LOCALGROUP_MEMBERS_INFO_0 memberInfo = (LOCALGROUP_MEMBERS_INFO_0)Marshal.PtrToStructure(
                            IntPtr.Add(bufPtr, i * Marshal.SizeOf(typeof(LOCALGROUP_MEMBERS_INFO_0))),
                            typeof(LOCALGROUP_MEMBERS_INFO_0));

                        SecurityIdentifier Sid = new SecurityIdentifier(memberInfo.PSid);
                        sidList.Add(Sid);
                    }
                }

            }
            finally
            {
                if (bufPtr != IntPtr.Zero)
                {
                    NativeMethods.NetApiBufferFree(bufPtr);
                }
            }

            return sidList;
        }

    }

    // Logic
    public sealed class LsaUtils : IDisposable
    {
        [Flags]
        private enum Access : int
        {
            POLICY_VIEW_LOCAL_INFORMATION = 0x00000001,
            POLICY_LOOKUP_NAMES = 0x00000800,
        }

        private const uint STATUS_NO_MORE_ENTRIES = 0x8000001a;
        private const int NO_ERROR = 0;
        private const int ERROR_INSUFFICIENT_BUFFER = 122;
        private const int ERROR_NONE_MAPPED = 1332;

        private IntPtr _lsaHandle;

        public LsaUtils()
        {
            LsaObjectAttributes lsaAttr;
            lsaAttr.RootDirectory = IntPtr.Zero;
            lsaAttr.ObjectName = IntPtr.Zero;
            lsaAttr.Attributes = 0;
            lsaAttr.SecurityDescriptor = IntPtr.Zero;
            lsaAttr.SecurityQualityOfService = IntPtr.Zero;
            lsaAttr.Length = Marshal.SizeOf(typeof(LsaObjectAttributes));
            _lsaHandle = IntPtr.Zero;

            uint ret = NativeMethods.LsaOpenPolicy(
                null,
                ref lsaAttr, (int)(Access.POLICY_LOOKUP_NAMES | Access.POLICY_VIEW_LOCAL_INFORMATION),
                out _lsaHandle
                ); // Can also work for remote computers

            if (ret != NO_ERROR)
            {
                throw HelperMethods.InformativeException(MethodBase.GetCurrentMethod().Name, NativeMethods.LsaNtStatusToWinError((int)ret));
            }

        }


        public SecurityIdentifier[] EnumerateAccountsWithUserRight(Rights privilege)
        {
            ulong sidCount = 0;
            LsaUnicodeString[] rights = new LsaUnicodeString[1];
            rights[0] = InitLsaString(privilege.ToString());
            IntPtr sidsBuffer = IntPtr.Zero;
            uint ret = NativeMethods.LsaEnumerateAccountsWithUserRight(_lsaHandle, rights, out sidsBuffer, out sidCount);

            if (ret != NO_ERROR)
            {
                if (ret == STATUS_NO_MORE_ENTRIES)
                {
                    return null;
                }

                if (sidsBuffer != IntPtr.Zero)
                {
                    int freeBufferRet = NativeMethods.LsaFreeMemory(sidsBuffer);
                    if (freeBufferRet != NO_ERROR)
                    {
                        Win32Exception ex = new Win32Exception(NativeMethods.LsaNtStatusToWinError((int)ret));
                        throw HelperMethods.InformativeException(MethodBase.GetCurrentMethod().Name, NativeMethods.LsaNtStatusToWinError((int)freeBufferRet), String.Format("Occurred while freeing buffer inside catch of {0}", ex));
                    }
                }

                throw HelperMethods.InformativeException(MethodBase.GetCurrentMethod().Name, NativeMethods.LsaNtStatusToWinError((int)ret));
            }

            SecurityIdentifier[] accounts = new SecurityIdentifier[sidCount];
            for (int i = 0; i < (int)sidCount; i++)
            {
                LsaEnumerationInformation lsaInfo = (LsaEnumerationInformation)Marshal.PtrToStructure(
                    IntPtr.Add(sidsBuffer, i * Marshal.SizeOf(typeof(LsaEnumerationInformation))),
                    typeof(LsaEnumerationInformation));


                SecurityIdentifier sid = new SecurityIdentifier(lsaInfo.PSid);
                accounts[i] = sid;
            }

            NativeMethods.LsaFreeMemory(sidsBuffer);
            return accounts;
        }


        public Principal LookupSid(SecurityIdentifier sid)
        {

            StringBuilder name = new StringBuilder();
            uint cchName = (uint)name.Capacity;
            StringBuilder referencedDomainName = new StringBuilder();
            uint cchReferencedDomainName = (uint)referencedDomainName.Capacity;
            SIDNameUse sidUse;

            int err = NO_ERROR;

            byte[] sidBytes = new byte[sid.BinaryLength];
            sid.GetBinaryForm(sidBytes, 0);

            if (!NativeMethods.LookupAccountSid(null, sidBytes, name, ref cchName, referencedDomainName, ref cchReferencedDomainName, out sidUse))
            {
                err = Marshal.GetLastWin32Error();
                if (err == ERROR_INSUFFICIENT_BUFFER)
                {
                    name.EnsureCapacity((int)cchName);
                    referencedDomainName.EnsureCapacity((int)cchReferencedDomainName);
                    err = NO_ERROR;
                    // Buffer was not enough, trying again
                    if (!NativeMethods.LookupAccountSid(null, sidBytes, name, ref cchName, referencedDomainName, ref cchReferencedDomainName, out sidUse))
                        err = Marshal.GetLastWin32Error();
                }
            }

            if (err == ERROR_NONE_MAPPED)
            {
                // Couldn't find Member info - Usually has to do with AAD-joined devices.
                return new Principal
                {
                    Sid = sid
                };
            }
            if (err != 0)
            {
                throw HelperMethods.InformativeException(MethodBase.GetCurrentMethod().Name, NativeMethods.LsaNtStatusToWinError((int)err));
            }

            return new Principal
            {
                DomainName = referencedDomainName.ToString(),
                Name = name.ToString(),
                SidType = sidUse,
                Sid = sid
            };
        }


        // LSA helper functions:
        private static LsaUnicodeString InitLsaString(string s)
        {
            // Unicode strings max. 32KB
            if (s.Length > 0x7ffe)
            {
                throw new ArgumentException(string.Format("{0}: String too long", MethodBase.GetCurrentMethod().Name));
            }
            LsaUnicodeString lus = new LsaUnicodeString();
            lus.Buffer = s;
            lus.Length = (ushort)(s.Length * sizeof(char));
            lus.MaximumLength = (ushort)(lus.Length + sizeof(char));

            return lus;
        }
        public void Dispose()
        {
            if (_lsaHandle != IntPtr.Zero)
            {
                NativeMethods.LsaClose(_lsaHandle);
                _lsaHandle = IntPtr.Zero;
            }
            GC.SuppressFinalize(this);
        }
        ~LsaUtils() { Dispose(); }
    }
}
'@

$StartCpu = Get-WmiObject -class win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average
$StartTime = Get-Date
$ExitCode = 1100

function ExitWithCode
{
    param
    (
        $exitcode
    )

    $host.SetShouldExit($exitcode)
    exit
}


Add-Type -TypeDefinition $EtwWriter -Language CSharp -IgnoreWarnings
Add-Type -TypeDefinition $LSAUtility -Language CSharp -IgnoreWarnings
$global:EtwProvider =  New-Object -TypeName TvmEventSource


function Write-Telemetry {
    param(
        [Parameter(Mandatory=$true)]
        [AllowEmptyString()]
        [string]$IdentitiesAsJson,
        [Parameter(Mandatory=$true)]
        [AllowEmptyString()]
        [string]$UserRight,
        [Parameter(Mandatory=$true)]
        [AllowEmptyString()]
        [string]$MachineSID,
        [Parameter(Mandatory=$true)]
        [AllowEmptyString()]
        [string]$DomainSID
    )
    
    $etw = New-Object "AllowedLocalRightUsersCollectorEvent" -Property @{
        IdentitiesJson = $IdentitiesAsJson;
        UserRight = $UserRight;
        MachineSID = $MachineSID;
        DomainSID = $DomainSID;
    }

    $global:EtwProvider.Write("AllowedLocalRightUsersCollectorEvent", $etw)
}

function Get-AccountDomainSourceSid ($LocalMachineSidPrefix, $SID) {
    if ($SID.StartsWith("S-1-11")) {
        return "MicrosoftAccount"
    }
    if ($SID.StartsWith("S-1-12")) {
        return "AzureAD"
    }
    if ($SID.StartsWith($LocalMachineSidPrefix)) {
        return "Local"
    }
    if ($SID.StartsWith("S-1-5-21")) {
        return "Domain"
    }
    return "LocalOther"
}

function Get-AccountsWithUserRight([LSAutility.LsaUtils] $lsa, [LSAUtility.Rights] $Right, [string]$LocalMachineSidPrefix) {
    
    try {
        $SecurityIdentifiers = $lsa.EnumerateAccountsWithUserRight($Right);
        $Identities = @{}
        foreach ($Sid in $SecurityIdentifiers) {
            if (!$Identities.ContainsKey($Sid.Value)) {
                # Find the source of the identity, categorizing by SID prefix and Local Machine SID
                $IdentitySource = Get-AccountDomainSourceSid $LocalMachineSidPrefix $Sid.Value
                $Identity = [PSCustomObject]@{
                    Source = $IdentitySource
                    ParentSID = $null
                    SID = $Sid.Value
                }
                $Identities.Add($Sid.Value, $Identity)

                if ($Identity.Source -eq "Local" -Or $Identity.Source -eq "LocalOther") {
                    try {
                        $LocalPrincipal = $lsa.LookupSid($Sid)
                        # Check if builtin group or local group for further enum
                        if ($LocalPrincipal.SidType -eq [LSAUtility.SIDNameUse]::SidTypeGroup -Or $LocalPrincipal.SidType -eq [LSAUtility.SIDNameUse]::SidTypeAlias) {
                            $GroupMembersSIDs = [LSAUtility.NetApiUtils]::GetLocalGroupUsers($LocalPrincipal.Name)
                            $ParentSID = $Identity.SID
                            foreach ($MemberSID in $GroupMembersSIDs) {
                                if (!$Identities.ContainsKey($MemberSID.Value)) {
                                    # Find the source of the identity, categorizing by SID prefix and Local Machine SID
                                    $IdentitySource = Get-AccountDomainSourceSid $LocalMachineSidPrefix $MemberSID.Value
                                    $Identity = [PSCustomObject]@{
                                        Source = $IdentitySource
                                        ParentSID = $ParentSID
                                        SID = $MemberSID.Value
                                    }
                                    $Identities.Add($MemberSID.Value, $Identity)
                                }
                            }
                        }
                    } catch {
                        $errStr = "Failed to lookup local SID  {0}:{1}" -f $Identity.SID, $Error[0].Exception.ToString()
                        Write-Error $errStr
                    }
                }
            }
        }
        $Identities
    } catch {
        $errStr = "Failed to get right {0}:{1}" -f $Right, $Error[0].Exception.ToString()
        Write-Error $errStr
    }

}


### Main Logic
# Get local machine SID from registry
$LocalMachineSidPrefix = ""
try {
    $MachineSIDKey = Get-ItemProperty -Path HKLM:\security\Policy\PolAcDmS\
    $LocalMachineSidObj = New-Object System.Security.Principal.SecurityIdentifier($MachineSIDKey.'(default)',0)
    $LocalMachineSidPrefix = $LocalMachineSidObj.Value
} catch {
    $errStr = "Failed to get Local Machine SID:{0}" -f $Error[0].Exception.ToString()
    Write-Error $errStr
    ExitWithCode 1109
}
$lsa = New-Object LSAUtility.LsaUtils;

foreach ($right in $UserRights) {
    $Identities = Get-AccountsWithUserRight $lsa $right $LocalMachineSidPrefix
    if($DeniableRights.Keys -contains $right) {
        $DeniedRight = $DeniableRights[$right]
        $DeniedIdentities = Get-AccountsWithUserRight $lsa $DeniedRight $LocalMachineSidPrefix
        $NewIdentities = @{}
        foreach($Identity in $Identities.Keys) {
            if($DeniedIdentities.Keys -NotContains $Identity) {
                $NewIdentities.Add($Identity, $Identities.Item($Identity))
            }
        }
        $Identities = $NewIdentities
    }

    $AllowedUsers = @($Identities.Values | Select-object -Property Sid,Source,ParentSID)
    # Get domain SID by getting first domain SID
    $FirstDomainUserSid = ($AllowedUsers | Where-Object Source -eq "Domain" | Select-Object -First 1 SID)
    $DomainSID = ""
    if ($FirstDomainUserSid) {
        $FirstDomainUserSidStr = $FirstDomainUserSid.SID
        $DomainSID = $FirstDomainUserSidStr.Substring(0,$FirstDomainUserSidStr.LastIndexOf("-"))
    }
    $IdentitiesAsJson = $AllowedUsers | ConvertTo-Json
    Write-Telemetry $IdentitiesAsJson $right $LocalMachineSidPrefix $DomainSID
}

$LogicalProcessors = (Get-WmiObject -class Win32_processor | Measure-Object -Property NumberOfLogicalProcessors -Sum ).sum;
$TotalMemory = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum

$ProcessInfo = (Get-Process -Id $Pid)

$MemoryUtilization = [Math]::Round(($ProcessInfo.WS * 100 / $TotalMemory), 2)
$CpuUtilization = [Math]::Round(($ProcessInfo.CPU * 100 / $((New-TimeSpan -Start $ProcessInfo.StartTime).TotalSeconds)) /$LogicalProcessors, 2)

$Timespan = New-TimeSpan -Start $StartTime -End (Get-Date) | Select-Object -ExpandProperty TotalSeconds

$EndCpu = Get-WmiObject -class win32_processor | Measure-Object -property LoadPercentage -Average | Select-Object -ExpandProperty Average

$TotalLocalEntities = ($AllowedUsers | Where-Object {$_.Source -eq "Local" -or $_.Source -eq "LocalOther"}).Count
$TotalDomainEntities = ($AllowedUsers | Where-Object {$_.Source -eq "Domain"}).Count
$TotalAzureADEntities = ($AllowedUsers | Where-Object {$_.Source -eq "AzureAd"}).Count
$TotalIdentities = $AllowedUsers.Count

Write-Host "Writing telemtry"
Write-Host "ScriptVersion->$ScriptVersion"
Write-Host "Duration->$Timespan"
Write-Host "Memory->$($ProcessInfo.WS/1024)Kb,$MemoryUtilization%"
Write-Host "CPU->$($ProcessInfo.CPU.ToString()),$CpuUtilization%"
Write-Host "TotalCpu->$StartCpu%,$EndCpu%"
Write-Host "TotalLocalEntities->$TotalLocalEntities"
Write-Host "TotalDomainEntities->$TotalDomainEntities"
Write-Host "TotalAzureADEntities->$TotalAzureADEntities"
Write-Host "TotalIdentities->$TotalIdentities"
Write-Host "TotalRights->$($UserRights.Count)"

ExitWithCode $ExitCode
# SIG # Begin signature block
# MIIoZAYJKoZIhvcNAQcCoIIoVTCCKFECAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCep+cCQXC8+k82
# MYVMgSqZBBsqKVqMX2MbL/ov+79o4KCCDZcwggYVMIID/aADAgECAhMzAAAEOExw
# F8dThPTzAAAAAAQ4MA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjQxMTE1MDAwMTIzWhcNMjUxMTEzMDAwMTIzWjCBlDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjE+MDwGA1UEAxM1TWlj
# cm9zb2Z0IFdpbmRvd3MgRGVmZW5kZXIgQWR2YW5jZWQgVGhyZWF0IFByb3RlY3Rp
# b24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7XRtbYKag9kcj7xkU
# ngKJasJqOoGURz5mjsXKDgxWbKkHzjZn2dUlQetNwLN3RrR/2rrNhGM4Vour57xq
# L6MijWd6HfBkGZAl/h3ALhPLrertldZ0FhEzt/kLSsbx/2xq5Vwlt7RkRzwJSoeO
# 4jnXQUaG+dAb9mQW87vtDEARcKJqTTGB5W685hOyg4FWkb1nGPc4WgYE53Ri2XZv
# cCvuCsz5JmIbPjoQQHKomxaAr+wuea7o+r0M/bbm2Ok8v9LcX9bGx1ch515nXVkK
# PfCDQQbJ27pOlEEVOuu9WOHqs5zDCRO5Q4u6VrO/Q9+YF0snySMgsSJQ04BMeKDz
# uoHdAgMBAAGjggFzMIIBbzAfBgNVHSUEGDAWBggrBgEFBQcDAwYKKwYBBAGCN0wv
# ATAdBgNVHQ4EFgQU02W11Adr5UTyXh234s3aOhbYszEwRQYDVR0RBD4wPKQ6MDgx
# HjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEWMBQGA1UEBRMNNDUxODk0
# KzUwMzM3MzAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8E
# TTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9N
# aWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBR
# BggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0
# cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAw
# DQYJKoZIhvcNAQELBQADggIBAJFkkzz+21rdOP2DeayTmrKJr3DK/NC2aKa+1TSl
# vaOVCWsqb1pcyqeLzUzCBuNCww5re19s/OESbO65iY3Ky7LquPeI8ZLWPugu8YRm
# 3s3rubr7d+GE0sx8NsOrkl4rfMpcweJ4grwFgrbvXDWEXvZBINlon7UIRsXB+oRH
# astYgbi5mV/1Y5s48vRHaErdlfJVPuyZ3cINFUM/FWMC2pQT17Qsc+76VR0JBC3W
# EHbj6bMkwNJ2881VAthRw2HuR+VSeDo4Qye+WDoq8YGo0wP1futayOCtQKv8ss8E
# E+PhNJhbojtwxKkrj4OspfPcUuna2bl0XFYWmMcK7Nd8ZF/yXEhOm1XQ+34d6KuA
# L3PvUm91X7Dp40jwMj1hMdpGi/p+SAOwzmeYMUw9+ZSaqrPDnDENSiiHCLayYN+E
# 3GMyo2Ha46Dhoop3jWnfMeTOIuY8hL5qiMeRg2WVHT3Y00UKThBnNo3XEf4zmpnx
# J4y/KDP+ntELIl52LLEQL5rzsGum6YRNxhySKbiimX9aj3zUFryeMk9WPgI1ACVG
# tflE5jeQ27eyOhdkwwYTOftQMhknSLXRbKe3q9FOraeYuORsBsyP+G29bnKPIZcs
# MkjsXy3N6HmJV/HYryosl9aaPejoITRumEuhwtt9zcVuCKwg/UY8nA2elYn6mwss
# 4NoRMIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWlj
# cm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4
# MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBD
# QSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3Y
# bqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUB
# FDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnbo
# MlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT
# +OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuy
# e4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEh
# NSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2
# z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3
# s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78Ic
# V9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E
# 11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5P
# M4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcV
# AQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3
# FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAf
# BgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBL
# hklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggr
# BgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNS
# b29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsG
# AQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwA
# ZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0G
# CSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDB
# ZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc
# 8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYq
# wooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu
# 5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWI
# UUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXh
# j38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yH
# PgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtI
# EJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4Guzq
# N5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgR
# MiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQ
# zTGCGiMwghofAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEC
# EzMAAAQ4THAXx1OE9PMAAAAABDgwDQYJYIZIAWUDBAIBBQCgga4wGQYJKoZIhvcN
# AQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUw
# LwYJKoZIhvcNAQkEMSIEIEBYODh0eMspkqhovG7nzgevMQtVTFNpc+w4XoEerDl9
# MEIGCisGAQQBgjcCAQwxNDAyoBSAEgBNAGkAYwByAG8AcwBvAGYAdKEagBhodHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20wDQYJKoZIhvcNAQEBBQAEggEAM94icXtTOuIU
# wQ8PshH2OQ4gI4C5yJptbKQRJU/hkqFC33N9H16a9eno4QlLvN8SzIZZvd4mfW8l
# bGK6XYnjOWP2czuEwBxaGnfXXhNVF0lHe9XVIBQkDTBCUp5m7Vt/e3E0WeMkqidC
# zDoAtuIDijA68xxFLhz+FoJqsOSTvc/gBnsWo5P6Eq1jgb0LVavxsZbfz58Krkil
# rRD3XJ1XwzO+JnM93d6mv8oR6axe6xHyOLQ74KeseJfpkREnnWQnjWR8fA6uwowQ
# pzUHYgwkz8n2hOc5DlRkr4y+eZOLzpagq1cbSpQn+MAo3JD2nRUsOsraHDjb0N6w
# eHA76dJJvqGCF60wghepBgorBgEEAYI3AwMBMYIXmTCCF5UGCSqGSIb3DQEHAqCC
# F4YwgheCAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFaBgsqhkiG9w0BCRABBKCCAUkE
# ggFFMIIBQQIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQCAQUABCAxv339cVS9
# wZlFJo6aq/vSUqgmsNfWSVE4Oo4cXpaBxwIGaC4zls9jGBMyMDI1MDYwNTE0NDIz
# OC4xNTNaMASAAgH0oIHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo1OTFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCEfswggco
# MIIFEKADAgECAhMzAAAB9BdGhcDLPznlAAEAAAH0MA0GCSqGSIb3DQEBCwUAMHwx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTI0MDcyNTE4MzA1OVoXDTI1
# MTAyMjE4MzA1OVowgdMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRl
# ZDEnMCUGA1UECxMeblNoaWVsZCBUU1MgRVNOOjU5MUEtMDVFMC1EOTQ3MSUwIwYD
# VQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIICIjANBgkqhkiG9w0B
# AQEFAAOCAg8AMIICCgKCAgEApwhOE6bQgC9qq4jJGX2A1yoObfk0qetQ8kkj+5m3
# 7WBxDlsZ5oJnjfzHspqPiOEVzZ2y2ygGgNZ3/xdZQN7f9A1Wp1Adh5qHXZZh3SBX
# 8ABuc69Tb3cJ5KCZcXDsufwmXeCj81EzJEIZquVdV8STlQueB/b1MIYt5RKis3uw
# zdlfSl0ckHbGzoO91YTKg6IExqKYojGreCopnIKxOvkr5VZsj2f95Bb1LGEvuhBI
# m/C7JysvJvBZWNtrspzyXVnuo+kDEyZwpkphsR8Zvdi+s/pQiofmdbW1UqzWlqXQ
# VgoYXbaYkEyaSh/heBtwj1tue+LcuOcHAPgbwZvQLksKaK46oktregOR4e0icsGi
# AWR9IL+ny4mlCUNA84F7GEEWOEvibig7wsrTa6ZbzuMsyTi2Az4qPV3QRkFgxSbp
# 4R4OEKnin8Jz4XLI1wXhBhIpMGfA3BT850nqamzSiD5L5px+VtfCi0MJTS2LDF1P
# aVZwlyVZIVjVHK8oh2HYG9T26FjR9/I85i5ExxmhHpxM2Z+UhJeZA6Lz452m/+xr
# A4xrdYas5cm7FUhy24rPLVH+Fy+ZywHAp9c9oWTrtjfIKqLIvYtgJc41Q8WxbZPR
# 7B1uft8BFsvz2dOSLkxPDLcXWy16ANy73v0ipCxAwUEC9hssi0LdB8ThiNf/4A+R
# Z8sCAwEAAaOCAUkwggFFMB0GA1UdDgQWBBQrdGWhCtEsPid1LJzsTaLTKQbfmzAf
# BgNVHSMEGDAWgBSfpxVdAF5iXYP05dJlpxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQ
# hk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNyb3NvZnQl
# MjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBe
# MFwGCCsGAQUFBzAChlBodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2Nl
# cnRzL01pY3Jvc29mdCUyMFRpbWUtU3RhbXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAM
# BgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQMMAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQE
# AwIHgDANBgkqhkiG9w0BAQsFAAOCAgEA3cHSDxJKUDsgacIfRX60ugODShsBqwtE
# URUbUXeDmYYSa5oFj34RujW3gOeCt/ObDO45vfpnYG5OS5YowwsFw19giCI6JV+c
# cG/qqM08nxASbzwWtqtorzQiJh9upsE4TVZeKYXmbyx7WN9tdbVIrCelVj7P6ifM
# HTSLt6BmyoS2xlC2cfgKPPA13vS3euqUl6zwe7GAhjfjNXjKlE4SNWJvdqgrv0GU
# RKjqmamNvhmSJane6TYzpdDCegq8adlGH85I1EWKmfERb1lzKy5OMO2e9IkAlvyd
# pUun0C3sNEtp0ehliT0Sraq8jcYVDH4A2C/MbLBIwikjwiFGQ4SlFLT2Tgb4Gvvp
# cWVzBxwDo9IRBwpzngbyzbhh95UVOrQL2rbWHrHDSE3dgdL2yuaHRgY7HYYLs5Lt
# s30wU9Ouh8N54RUta6GFZFx5A4uITgyJcVdWVaN0qjs0eEjwEyNUv0cRLuHWJBej
# kMe3qRAhvCjnhro7DGRWaIldyfzZqln6FsnLQ3bl+ZvVJWTYJuL+IZLI2Si3IrIR
# fjccn29X2BX/vz2KcYubIjK6XfYvrZQN4XKbnvSqBNAwIPY2xJeB4o9PDEFI2rcP
# aLUyz5IV7JP3JRpgg3xsUqvFHlSG6uMIWjwH0GQIIwrC2zRy+lNZsOKnruyyHMQT
# P7jy5U92qEEwggdxMIIFWaADAgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqG
# SIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkg
# MjAxMDAeFw0yMTA5MzAxODIyMjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFBDQSAyMDEwMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4X
# YDP/XE/HZveVU3Fa4n5KWv64NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTz
# xXb1hlDcwUTIcVxRMTegCjhuje3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7
# uhp7M62AW36MEBydUv626GIl3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlw
# aQ3KNi1wjjHINSi947SHJMPgyY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedG
# bsoy1cCGMFxPLOJiss254o2I5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXN
# xF803RKJ1v2lIH1+/NmeRd+2ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03
# dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9
# ahhaYQFzymeiXtcodgLiMxhy16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5
# UPkLiWHzNgY1GIRH29wb0f2y1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReT
# wDwV2xo3xwgVGD94q0W29R6HXtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZ
# MBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8
# RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAE
# VTBTMFEGDCsGAQQBgjdMg30BATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpb3BzL0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAww
# CgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQD
# AgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb
# 186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29t
# L3BraS9jcmwvcHJvZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoG
# CCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQu
# Y29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZI
# hvcNAQELBQADggIBAJ1VffwqreEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9
# MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2Lpyp
# glYAA7AFvonoaeC6Ce5732pvvinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OO
# PcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8
# DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA
# 0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1Rt
# nWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjc
# ZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq7
# 7EFmPWn9y8FBSX5+k77L+DvktxW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJ
# C4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328
# y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYID
# VjCCAj4CAQEwggEBoYHZpIHWMIHTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2Fz
# aGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
# cnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25z
# IExpbWl0ZWQxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVTTjo1OTFBLTA1RTAtRDk0
# NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIjCgEBMAcG
# BSsOAwIaAxUAv+LZ/Vg0s17Xek4iG9R9c/7+AI6ggYMwgYCkfjB8MQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
# VGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsFAAIFAOvrzmQwIhgPMjAy
# NTA2MDUwODA1NTZaGA8yMDI1MDYwNjA4MDU1NlowdDA6BgorBgEEAYRZCgQBMSww
# KjAKAgUA6+vOZAIBADAHAgEAAgIlpDAHAgEAAgISFTAKAgUA6+0f5AIBADA2Bgor
# BgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAowCAIBAAIDB6EgoQowCAIBAAID
# AYagMA0GCSqGSIb3DQEBCwUAA4IBAQAZPP6P8xoBb6Q0RSUbLO2IRTSV+qmm7LoK
# wtJ151o29CEiLkDv3xVJDp3HgmO+ZWjBqvH6KCbE/u19qNWmdsu1pw/NlAP8U/eb
# XvBlUtTUhR0hogmyQLdTiTZUCbR1DGNgLb8PEUUTdA4CV04/amtWi3W5mZSYzElz
# 4obSfe2pIAmYheigJkCIzTzGPwDfAtcnKD0LKbYiGyJ/B3jG5IIB0v+wMdAO3+pj
# 2jFPpgqB43qT45Z1HgnUIWm0Z9UZYhQ86IUABC6Vv9joJh2yLLlTnl4ARuPuEeMs
# AKY2rMjhtI5VsfiTsyvsBUeFgRY+BLIPcyT0JkKUuiCj4G2GgP3RMYIEDTCCBAkC
# AQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
# BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQG
# A1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAH0F0aFwMs/
# OeUAAQAAAfQwDQYJYIZIAWUDBAIBBQCgggFKMBoGCSqGSIb3DQEJAzENBgsqhkiG
# 9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgJncWe3KhL4QR/dePkmeivDjhiH5PUYmW
# uXvVErZpOj0wgfoGCyqGSIb3DQEJEAIvMYHqMIHnMIHkMIG9BCA/WMJ8biaT6njv
# kknB8Q7hSQIi8ys6vIBvZg60RBjWazCBmDCBgKR+MHwxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0
# YW1wIFBDQSAyMDEwAhMzAAAB9BdGhcDLPznlAAEAAAH0MCIEIGIXvkkHBQgRXpoA
# BkBDBxqeI4ZX5ReCtP+pSE2N7DgPMA0GCSqGSIb3DQEBCwUABIICAEPKNK287aBT
# 0QEK8A4HTH/pyul90+22L2z+EAkadnO/8x5U8eglEh3LKsh9zA7u5hwU4FjaZaEV
# z67+DZ7UUdyItsByyYQkx4Gbwkmj9S2yhDOdNYJN+eni5nHoSqzQVa1PB9VNcoXD
# g3rhB07Db43dvLDDM8SkfNnmcNjJRvo3/tOC3WR6hFGSw4/d0QIlnP9BGZghEbwC
# /Vk1y5s25gSuujUPI0DlCqoWohxuquTWSmkjytmPwlQ6PHzbD9Ef7zQ90VgglhCM
# h0TvF44ZLqogVF5Jk6FCVXfAnwbyJ1WJdMf64xAMPejCFbPayDALhxF0l/nFdcQR
# Q6y936rDlcKEYZCoEw0Yki9z714LVLb+xh/mp7ji2X5LmycwCVsw8GWs7WUvovBY
# l0/+ojucg1+mJ47Zhjn7L4xbPfGJQlwZKh46l7An3aGEIJjk/BR+jAOUWE3p8oFC
# mgE2gCSApr17BCsFZ/H+DCtdQnK6COd1NTLvglmDZ/ggc6hoO8dS4iH1GJiuNQaf
# 9H7hQ7s2f+7nYNfxgm7u2CLxnWWiCfBO5Uxgz2m6looOQeXgEPLS99NPxXOas01G
# sMhq9hO6qGd33uIVVbph7u9HEjRD8SiveVXASy6zeyMcy7dIzs/+sirXJmEGLj7K
# UX+6ZK6IQrO6NotrnEKHCyMc+Bv8VcAr
# SIG # End signature block
