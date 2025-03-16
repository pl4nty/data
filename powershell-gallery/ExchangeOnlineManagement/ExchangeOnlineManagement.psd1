@{
RootModule = if($PSEdition -eq 'Core')
{
    '.\netCore\ExchangeOnlineManagement.psm1'
}
else # Desktop
{
    '.\netFramework\ExchangeOnlineManagement.psm1'
}
FunctionsToExport = @('Connect-ExchangeOnline', 'Connect-IPPSSession', 'Disconnect-ExchangeOnline')
ModuleVersion = '3.7.1'
GUID = 'B5ECED50-AFA4-455B-847A-D8FB64140A22'
Author = 'Microsoft Corporation'
CompanyName = 'Microsoft Corporation'
Copyright = '(c) 2021 Microsoft. All rights reserved.'
Description = 'This is a General Availability (GA) release of the Exchange Online Powershell V3 module. Exchange Online cmdlets in this module are REST-backed and do not require Basic Authentication to be enabled in WinRM. REST-based connections in Windows require the PowerShellGet module, and by dependency, the PackageManagement module.
Please check the documentation here - https://aka.ms/exov3-module.
For issues related to the module, contact Microsoft support.'
PowerShellVersion = '3.0'
CmdletsToExport = @('Add-VivaModuleFeaturePolicy','Add-VivaOrgInsightsDelegatedRole','Get-ConnectionInformation','Get-DefaultTenantBriefingConfig','Get-DefaultTenantMyAnalyticsFeatureConfig','Get-EXOCasMailbox','Get-EXOMailbox','Get-EXOMailboxFolderPermission','Get-EXOMailboxFolderStatistics','Get-EXOMailboxPermission','Get-EXOMailboxStatistics','Get-EXOMobileDeviceStatistics','Get-EXORecipient','Get-EXORecipientPermission','Get-MyAnalyticsFeatureConfig','Get-UserBriefingConfig','Get-VivaFeatureCategory','Get-VivaInsightsSettings','Get-VivaModuleFeature','Get-VivaModuleFeatureEnablement','Get-VivaModuleFeaturePolicy','Get-VivaOrgInsightsDelegatedRole','Remove-VivaModuleFeaturePolicy','Remove-VivaOrgInsightsDelegatedRole','Set-DefaultTenantBriefingConfig','Set-DefaultTenantMyAnalyticsFeatureConfig','Set-MyAnalyticsFeatureConfig','Set-UserBriefingConfig','Set-VivaInsightsSettings','Update-VivaModuleFeaturePolicy')

# Add modules on which ExchangeOnlineManagement depend
RequiredModules = @(
    @{
        ModuleName     = 'PackageManagement'
        ModuleVersion  = '1.0.0.1'
    },
    @{
        ModuleName     = 'PowerShellGet'
        ModuleVersion  = '1.0.0.1'
    }
)

FileList = if($PSEdition -eq 'Core')
{
    @('.\netCore\Azure.Core.dll',
        '.\netCore\Microsoft.Bcl.AsyncInterfaces.dll',
        '.\netCore\Microsoft.Bcl.HashCode.dll',
        '.\netCore\Microsoft.Exchange.Management.AdminApiProvider.dll',
        '.\netCore\Microsoft.Exchange.Management.ExoPowershellGalleryModule.dll',
        '.\netCore\Microsoft.Exchange.Management.RestApiClient.dll',
        '.\netCore\Microsoft.Extensions.ObjectPool.dll',
        '.\netCore\Microsoft.Identity.Client.Broker.dll',
        '.\netCore\Microsoft.Identity.Client.dll',
        '.\netCore\Microsoft.Identity.Client.NativeInterop.dll',
        '.\netCore\Microsoft.IdentityModel.Abstractions.dll',
        '.\netCore\Microsoft.IdentityModel.JsonWebTokens.dll',
        '.\netCore\Microsoft.IdentityModel.Logging.dll',
        '.\netCore\Microsoft.IdentityModel.Tokens.dll',
        '.\netCore\Microsoft.OData.Client.dll',
        '.\netCore\Microsoft.OData.Core.dll',
        '.\netCore\Microsoft.OData.Edm.dll',
        '.\netCore\Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.dll',
        '.\netCore\Microsoft.Spatial.dll',
        '.\netCore\Microsoft.Win32.Registry.AccessControl.dll',
        '.\netCore\Microsoft.Win32.SystemEvents.dll',
        '.\netCore\msvcp140.dll',
        '.\netCore\Newtonsoft.Json.dll',
        '.\netCore\System.CodeDom.dll',
        '.\netCore\System.Configuration.ConfigurationManager.dll',
        '.\netCore\System.Diagnostics.EventLog.dll',
        '.\netCore\System.Diagnostics.PerformanceCounter.dll',
        '.\netCore\System.DirectoryServices.dll',
        '.\netCore\System.Drawing.Common.dll',
        '.\netCore\System.IdentityModel.Tokens.Jwt.dll',
        '.\netCore\System.Management.dll',
        '.\netCore\System.Memory.Data.dll',
        '.\netCore\System.Security.Cryptography.Pkcs.dll',
        '.\netCore\System.Security.Cryptography.ProtectedData.dll',
        '.\netCore\System.Security.Permissions.dll',
        '.\netCore\System.Windows.Extensions.dll',
        '.\netCore\vcruntime140_1.dll',
        '.\netCore\vcruntime140.dll',
        '.\license.txt')
}
else # Desktop
{
    @('.\netFramework\Microsoft.Bcl.AsyncInterfaces.dll',
        '.\netFramework\Microsoft.Exchange.Management.AdminApiProvider.dll',
        '.\netFramework\Microsoft.Exchange.Management.ExoPowershellGalleryModule.dll',
        '.\netFramework\Microsoft.Exchange.Management.RestApiClient.dll',
        '.\netFramework\Microsoft.Identity.Client.Broker.dll',
        '.\netFramework\Microsoft.Identity.Client.dll',
        '.\netFramework\Microsoft.Identity.Client.NativeInterop.dll',
        '.\netFramework\Microsoft.IdentityModel.Abstractions.dll',
        '.\netFramework\Microsoft.IdentityModel.JsonWebTokens.dll',
        '.\netFramework\Microsoft.IdentityModel.Logging.dll',
        '.\netFramework\Microsoft.IdentityModel.Tokens.dll',
        '.\netFramework\Microsoft.OData.Client.dll',
        '.\netFramework\Microsoft.OData.Core.dll',
        '.\netFramework\Microsoft.OData.Edm.dll',
        '.\netFramework\Microsoft.Online.CSE.RestApiPowerShellModule.Instrumentation.dll',
        '.\netFramework\Microsoft.Spatial.dll',
        '.\netFramework\Newtonsoft.Json.dll',
        '.\netFramework\System.Buffers.dll',
        '.\netFramework\System.IdentityModel.Tokens.Jwt.dll',
        '.\netFramework\System.Management.Automation.dll',
        '.\netFramework\System.Memory.dll',
        '.\netFramework\System.Numerics.Vectors.dll',
        '.\netFramework\System.Runtime.CompilerServices.Unsafe.dll',
        '.\netFramework\System.Text.Json.dll',
        '.\netFramework\System.Threading.Tasks.Extensions.dll',
        '.\license.txt')
}

PrivateData = @{
    PSData = @{
    # Tags applied to this module. These help with module discovery in online galleries.
    Tags = 'Exchange', 'ExchangeOnline', 'EXO', 'EXOV2', 'EXOV3', 'Mailbox', 'Management'
    ReleaseNotes = '
---------------------------------------------------------------------------------------------
What is new in this release:

v3.7.1 :
    1. Introduced a new property named ExoExchangeSecurityDescriptor in Get-ExoMailbox response, that is similar to ExchangeSecurityDescriptor property in Get-Mailbox response.
    2. Added new cmdlets Add-VivaOrgInsightsDelegatedRole, Get-VivaOrgInsightsDelegatedRole, and Remove-VivaOrgInsightsDelegatedRole for supporting Viva Org Insights Delegation feature.

---------------------------------------------------------------------------------------------
Previous Releases:

v3.7.0 :
    1. Integrated WAM (Web Account Manager) in Authentication flows to enhance security.
    2. Starting with EXO V3.7, use the LoadCmdletHelp parameter alongside Connect-ExchangeOnline to access the Get-Help cmdlet, as it will not be loaded by default.
    3. Fixed connection issues with app only authentication in Security & Compliance PowerShell.

v3.6.0 :
    1. Get-VivaModuleFeature now returns information about the kinds of identities the feature supports creating policies for (e.g., users, groups, or the entire tenant).
    2. Cmdlets for Viva feature access management will now handle continuous access evaluation (CAE) claims challengesAdded new cmdlets Get-VivaFeatureCategory and Get-VivaFeatureCategoryPolicy.
    3. Added fix for compatibility issue with Microsoft.Graph module.
v3.5.1 :
    1. Bug fixes in Get-EXOMailboxPermission and Get-EXOMailbox.
    2. The module has been upgraded to run on .NET 8, replacing the previous version based on .NET 6.
    3. Enhancements in Add-VivaModuleFeaturePolicy.
v3.5.0 :
    1. Added new cmdlet Get-VivaFeatureCategory
    2. Added support for policy operations at a category level for Viva GFAC (aka. VFAM - Viva Feature Access Management).
    3. Added a new return value IsFeatureEnabledByDefault in cmdlet Get-VivaModuleFeaturePolicy. This value informs of the default enablement state for users in the tenant when no tenant or user/group policies have been created.
v3.4.0 :
    1.  Bug fixes in Connect-ExchangeOnline, Get-EXORecipientPermission and Get-EXOMailboxFolderPermission.
    2.  Support to use Constrained Language Mode(CLM) using SigningCertificate parameter.

v3.3.0 :
    1.  Support to skip loading cmdlet help files with Connect-ExchangeOnline.
    2.  Global variable EXO_LastExecutionStatus can now be used to check the status of the last cmdlet that was executed.
    3.  Bug fixes in Connect-ExchangeOnline and Connect-IPPSSession.
    4.  Support of user controls enablement by policy for features that are onboarded to Viva feature access management.

v3.2.0 :
    1.  General Availability of new cmdlets:
        -  Updating Briefing Email Settings of a tenant (Get-DefaultTenantBriefingConfig and Set-DefaultTenantBriefingConfig)
        -  Updating Viva Insights Feature Settings of a tenant (Get-DefaultTenantMyAnalyticsFeatureConfig and Set-DefaultTenantMyAnalyticsFeatureConfig)
        -  View the features in Viva that support setting access management policies (Get-VivaModuleFeature)
        -  Create and manage Viva app feature policies
           -  Get-VivaModuleFeaturePolicy
           -  Add-VivaModuleFeaturePolicy
           -  Remove-VivaModuleFeaturePolicy
           -  Update-VivaModuleFeaturePolicy
        -  View whether or not a Viva feature is enabled for a specific user/group (Get-VivaModuleFeatureEnablement)

    2.  General Availability of REST based cmdlets for Security and Compliance PowerShell.
    3.  Support to get REST connection informations from Get-ConnectionInformation cmdlet and disconnect REST connections using Disconnect-ExchangeOnline cmdlet for specific connection(s).
    4.  Support to sign the temporary generated module with a client certificate to use the module in all PowerShell execution policies.
    5.  Bug fixes in Connect-ExchangeOnline.

v3.1.0 :
    1.  Support for providing an Access Token with Connect-ExchangeOnline.
    2.  Bug fixes in Connect-ExchangeOnline and Get-ConnectionInformation.
    3.  Bug fix in Connect-IPPSSession for connecting to Security and Compliance PowerShell using Certificate Thumbprint.

v3.0.0 :
    1.  General Availability of REST-backed cmdlets for Exchange Online which do not require WinRM Basic Authentication to be enabled.
    2.  General Availability of Certificate Based Authentication for Security and Compliance PowerShell cmdlets.
    3.  Support for System-Assigned and User-Assigned ManagedIdentities to connect to ExchangeOnline from Azure VMs, Azure Virtual Machine Scale Sets and Azure Functions.
    4.  Breaking changes
        -   Get-PSSession cannot be used to get information about the sessions created as PowerShell Remoting is no longer being used. The Get-ConnectionInformation cmdlet has been introduced instead, to get information about the existing connections to ExchangeOnline. Refer https://docs.microsoft.com/en-us/powershell/module/exchange/get-connectioninformation?view=exchange-ps for more information.
        -   Certain cmdlets that used to prompt for confirmation in specific scenarios will no longer have this prompt and the cmdlet will run to completion by default.
        -   The format of the error returned from a failed cmdlet execution has been slightly modified. The Exception contains some additional data such as the exception type, and the FullyQualifiedErrorId does not contain the FailureCategory. The format of the error is subject to further modifications.
        -   Deprecation of the Get-OwnerlessGroupPolicy and Set-OwnerlessGroupPolicy cmdlets.

v2.0.5 :
    1. Manage ownerless Microsoft 365 groups through newly added cmdlets Get-OwnerlessGroupPolicy and Set-OwnerlessGroupPolicy.
    2. Add new cmdlets Get-VivaInsightsSettings and Set-VivaInsightsSettings for Global/ExchangeOnline/Teams administrators to control user access of Headspace features in Viva Insights.

v2.0.4 :
    1. Manage EXO using Linux devices along with Browser based SSO Authentication for enhanced interactive management experience. No need to enter UserName and password everytime you run the PowerShell script.
    2. Manage EXO using Apple Macintosh devices. Supported versions of Apple MAC OS are Mojave, Catalina & Big Sur. Steps for installing PowerShell on MAC OS is documented here - https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-macos?view=powershell-7.1
    3. Real time policy & security enforcement in all user based authentication. Continuous Access Evaluation (CAE) has been enabled in EXO V2 Module. Read more about CAE here - https://techcommunity.microsoft.com/t5/azure-active-directory-identity/moving-towards-real-time-policy-and-security-enforcement/ba-p/1276933
    4. Use parameter InlineCredential to pass credentials of Non-MFA accounts on the go without the need of storing credentials in a variable
    5. More secure method to fetch access token using safe Reply URLs.
    6. Breaking change :- Change in cmdlet signature to configure MyAnalytics access for users in your tenant. Get/Set-UserAnalyticsConfig has been replaced by Get/Set-MyAnalyticsFeatureConfig Additionally, you can have more granular controls and configure access at feature level. For more steps read here - https://docs.microsoft.com/en-us/workplace-analytics/myanalytics/setup/configure-myanalytics

v2.0.3 :
    1. General availability of Certificate Based Authentication feature which enables using Modern Authentication in Unattended Scripting or background automation scenarios.
    2. Certificate Based Authentication accepts Certificate File directly from terminal thus enabling certificate files to be stored in Azure Key Vault and being fetched Just-In-Time for enhanced security. See parameter Certificate in Connect-ExchangeOnline.
    3. Connect with Exchange Online and Security Compliance Center simultaneously in a single PowerShell window.
    4. Ability to restrict the PowerShell cmdlets imported in a session using CommandName parameter, thus reducing memory footprint in case of high usage PowerShell applications.
    5. Get-ExoMailboxFolderPermission now supports ExternalDirectoryObjectID in the Identity parameter.
    6. Optimized latency of first V2 Cmdlet call. (Lab results show first call latency has been reduced from 8 seconds to ~1 seconds. Actual results will depend on result size and Tenant environment.)
 
v1.0.1 :
    1. This is the General Availability (GA) version of EXO PowerShell V2 Module. It is stable and ready for being used in production environments.
    2. Get-ExoMobileDeviceStatistics cmdlet now supports Identity parameter.
    3. Improved reliability of session auto-connect in certain cases where script was executing for ~50minutes and threw "Cmdlet not found" error due to a bug in auto-reconnect logic.
    4. Fixed data-type issues of two commonly used attributed "User" and "MailboxFolderUser" for easy migration of scripts.
    5. Enhanced support for filters as it now supports 4 more operators - endswith, contains, not and notlike support. Please check online documentation for attributes which are not supported in filter string.
 
---------------------------------------------------------------------------------------------
'
    LicenseUri='http://aka.ms/azps-license'
    }
}
}

# SIG # Begin signature block
