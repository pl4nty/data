#
# Module manifest for module 'Microsoft.Teams.Policy.Administration.Core'
#

@{
# Script module or binary module file associated with this manifest.
RootModule = './Microsoft.Teams.Policy.Administration.Cmdlets.Core.psm1'

# Version number of this module.
ModuleVersion = '23.4.4'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = '048c99d9-471a-4935-a810-542687c5f950'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Teams OCE cmdlets module for Policy Administration'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.7.2'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
CLRVersion = '4.0'

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = 'Amd64'

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# Removed this script from here because this module is used in SAW machines as well where Contraint Language Mode is on.
# Because of CLM constraint we were not able to import Teams module to SAW machines, that is why removing this script.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = '*'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @(
    'New-CsTeamsAppSetupPolicy',
    'Get-CsTeamsAppSetupPolicy',
    'Remove-CsTeamsAppSetupPolicy',
    'Set-CsTeamsAppSetupPolicy',
    'Grant-CsTeamsAppSetupPolicy',


    'New-CsTeamsAppPermissionPolicy',
    'Get-CsTeamsAppPermissionPolicy',
    'Remove-CsTeamsAppPermissionPolicy',
    'Set-CsTeamsAppPermissionPolicy',
    'Grant-CsTeamsAppPermissionPolicy',

    'New-CsTeamsMessagingPolicy',
    'Set-CsTeamsMessagingPolicy',
    'Get-CsTeamsMessagingPolicy',
    'Remove-CsTeamsMessagingPolicy',

    'New-CsTeamsChannelsPolicy',
    'Get-CsTeamsChannelsPolicy',
    'Remove-CsTeamsChannelsPolicy',
    'Set-CsTeamsChannelsPolicy',

    'New-CsTeamsUpdateManagementPolicy',
    'Get-CsTeamsUpdateManagementPolicy',
    'Remove-CsTeamsUpdateManagementPolicy',
    'Set-CsTeamsUpdateManagementPolicy',

    'Get-CsTeamsUpgradeConfiguration',
    'Set-CsTeamsUpgradeConfiguration',

    'New-CsTeamsMeetingPolicy',
    'Get-CsTeamsMeetingPolicy',
    'Remove-CsTeamsMeetingPolicy',
    'Set-CsTeamsMeetingPolicy',

    'Get-CsOnlineVoicemailPolicy',
    'New-CsOnlineVoicemailPolicy',
    'Remove-CsOnlineVoicemailPolicy',
    'Set-CsOnlineVoicemailPolicy',

    'Get-CsOnlineVoicemailValidationConfiguration',
    'Set-CsOnlineVoicemailValidationConfiguration',

    'New-CsTeamsFeedbackPolicy',
    'Get-CsTeamsFeedbackPolicy',
    'Remove-CsTeamsFeedbackPolicy',
    'Set-CsTeamsFeedbackPolicy',

    'New-CsTeamsMeetingBrandingPolicy',
    'Get-CsTeamsMeetingBrandingPolicy',
    'Remove-CsTeamsMeetingBrandingPolicy',
    'Set-CsTeamsMeetingBrandingPolicy',
    'Grant-CsTeamsMeetingBrandingPolicy'

    'New-CsTeamsMeetingBrandingTheme',
    'New-CsTeamsMeetingBackgroundImage',
    'New-CsTeamsNdiAssuranceSlate',

    'New-CsTeamsEmergencyCallingPolicy',
    'Get-CsTeamsEmergencyCallingPolicy',
    'Remove-CsTeamsEmergencyCallingPolicy',
    'Set-CsTeamsEmergencyCallingPolicy',
    'New-CsTeamsEmergencyCallingExtendedNotification',

    'New-CsTeamsCallHoldPolicy',
    'Get-CsTeamsCallHoldPolicy',
    'Remove-CsTeamsCallHoldPolicy',
    'Set-CsTeamsCallHoldPolicy',

    'Get-CsOnlineVoicemailValidationConfiguration',
    'Set-CsOnlineVoicemailValidationConfiguration',
    'Get-CsTeamsMessagingConfiguration',
    'Set-CsTeamsMessagingConfiguration',

    'New-CsTeamsVoiceApplicationsPolicy',
    'Get-CsTeamsVoiceApplicationsPolicy',
    'Remove-CsTeamsVoiceApplicationsPolicy',
    'Set-CsTeamsVoiceApplicationsPolicy',

    'New-CsTeamsHiddenMeetingTemplate',

    'New-CsTeamsMeetingTemplatePermissionPolicy',
    'Get-CsTeamsMeetingTemplatePermissionPolicy',
    'Set-CsTeamsMeetingTemplatePermissionPolicy',
    'Remove-CsTeamsMeetingTemplatePermissionPolicy',
    'Grant-CsTeamsMeetingTemplatePermissionPolicy',

    "Get-CsTeamsAudioConferencingCustomPromptsConfiguration",
    "Set-CsTeamsAudioConferencingCustomPromptsConfiguration",
    "New-CsCustomPrompt",
    "New-CsCustomPromptPackage",

    'Get-CsTeamsMeetingTemplateConfiguration',
    'Get-CsTeamsFirstPartyMeetingTemplateConfiguration',

    'New-CsTeamsEventsPolicy',
    'Get-CsTeamsEventsPolicy',
    'Remove-CsTeamsEventsPolicy',
    'Set-CsTeamsEventsPolicy',
    'Grant-CsTeamsEventsPolicy',

    'New-CsTeamsCallingPolicy',
    'Get-CsTeamsCallingPolicy',
    'Remove-CsTeamsCallingPolicy',
    'Set-CsTeamsCallingPolicy',
    'Grant-CsTeamsCallingPolicy',

    'New-CsTeamsPersonalAttendantPolicy',
    'Get-CsTeamsPersonalAttendantPolicy',
    'Remove-CsTeamsPersonalAttendantPolicy',
    'Set-CsTeamsPersonalAttendantPolicy',
    'Grant-CsTeamsPersonalAttendantPolicy',

    'New-CsExternalAccessPolicy',
    'Get-CsExternalAccessPolicy',
    'Remove-CsExternalAccessPolicy',
    'Set-CsExternalAccessPolicy',
    'Grant-CsExternalAccessPolicy',

    'Get-CsTeamsMultiTenantOrganizationConfiguration',
    'Set-CsTeamsMultiTenantOrganizationConfiguration',

    'New-CsLocationPolicy',
    'Get-CsLocationPolicy',
    'Remove-CsLocationPolicy',
    'Set-CsLocationPolicy',

    'New-CsTeamsCarrierEmergencyCallRoutingPolicy',
    'Get-CsTeamsCarrierEmergencyCallRoutingPolicy',
    'Remove-CsTeamsCarrierEmergencyCallRoutingPolicy',
    'Set-CsTeamsCarrierEmergencyCallRoutingPolicy',
    'Grant-CsTeamsCarrierEmergencyCallRoutingPolicy',

    'Get-CsTenantConfiguration',
    'Set-CsTenantConfiguration',

    'Get-CsTenantNetworkSite',

    'New-CsTeamsShiftsPolicy',
    'Get-CsTeamsShiftsPolicy',
    'Remove-CsTeamsShiftsPolicy',
    'Set-CsTeamsShiftsPolicy',
    'Grant-CsTeamsShiftsPolicy',

    'New-CsTeamsHiddenTemplate',

    'New-CsTeamsTemplatePermissionPolicy',
    'Get-CsTeamsTemplatePermissionPolicy',
    'Remove-CsTeamsTemplatePermissionPolicy',
    'Set-CsTeamsTemplatePermissionPolicy',

    'Get-CsTeamsAppPolicyConfiguration',
    'Set-CsTeamsAppPolicyConfiguration',

    'Get-CsTeamsSipDevicesConfiguration',
    'Set-CsTeamsSipDevicesConfiguration',

    'New-CsTeamsVirtualAppointmentsPolicy',
    'Get-CsTeamsVirtualAppointmentsPolicy',
    'Remove-CsTeamsVirtualAppointmentsPolicy',
    'Set-CsTeamsVirtualAppointmentsPolicy',
    'Grant-CsTeamsVirtualAppointmentsPolicy',

    'New-CsTeamsComplianceRecordingPolicy',
    'Get-CsTeamsComplianceRecordingPolicy',
    'Remove-CsTeamsComplianceRecordingPolicy',
    'Set-CsTeamsComplianceRecordingPolicy',

    'New-CsTeamsComplianceRecordingApplication',
    'Get-CsTeamsComplianceRecordingApplication',
    'Remove-CsTeamsComplianceRecordingApplication',
    'Set-CsTeamsComplianceRecordingApplication',

    'New-CsTeamsComplianceRecordingPairedApplication',

    'New-CsTeamsSharedCallingRoutingPolicy',
    'Get-CsTeamsSharedCallingRoutingPolicy',
    'Remove-CsTeamsSharedCallingRoutingPolicy',
    'Set-CsTeamsSharedCallingRoutingPolicy',
    'Grant-CsTeamsSharedCallingRoutingPolicy',

    'New-CsTeamsVdiPolicy',
    'Get-CsTeamsVdiPolicy',
    'Remove-CsTeamsVdiPolicy',
    'Set-CsTeamsVdiPolicy',
    'Grant-CsTeamsVdiPolicy',

    'Get-CsTeamsMeetingConfiguration',
    'Set-CsTeamsMeetingConfiguration',

    'New-CsTeamsCustomBannerText',
    'Get-CsTeamsCustomBannerText',
    'Set-CsTeamsCustomBannerText',
    'Remove-CsTeamsCustomBannerText',

    'Get-CsTeamsEducationConfiguration',
    'Set-CsTeamsEducationConfiguration',

    'New-CsTeamsWorkLocationDetectionPolicy',
    'Get-CsTeamsWorkLocationDetectionPolicy',
    'Remove-CsTeamsWorkLocationDetectionPolicy',
    'Set-CsTeamsWorkLocationDetectionPolicy',
    'Grant-CsTeamsWorkLocationDetectionPolicy', 

    'New-CsTeamsMediaConnectivityPolicy',
    'Get-CsTeamsMediaConnectivityPolicy',
    'Remove-CsTeamsMediaConnectivityPolicy',
    'Set-CsTeamsMediaConnectivityPolicy',
    'Grant-CsTeamsMediaConnectivityPolicy',

    'New-CsTeamsRecordingRollOutPolicy',
    'Get-CsTeamsRecordingRollOutPolicy',
    'Remove-CsTeamsRecordingRollOutPolicy',
    'Set-CsTeamsRecordingRollOutPolicy',
    'Grant-CsTeamsRecordingRollOutPolicy',
	
	'New-CsTeamsFilesPolicy',
    'Get-CsTeamsFilesPolicy',
    'Remove-CsTeamsFilesPolicy',
    'Set-CsTeamsFilesPolicy',
    'Grant-CsTeamsFilesPolicy',
    
    'Get-CsTeamsExternalAccessConfiguration',
    'Set-CsTeamsExternalAccessConfiguration',

    'New-CsConversationRole',
    'Remove-CsConversationRole',
    'Get-CsConversationRole',
    'Set-CsConversationRole',

    'Get-CsConversationRolesSetting',
    'Set-CsConversationRolesSetting',

    'Get-CsTeamsAIPolicy',
    'Set-CsTeamsAIPolicy',
    'New-CsTeamsAIPolicy',
    'Remove-CsTeamsAIPolicy',
    'Grant-CsTeamsAIPolicy',

    'New-CsTeamsBYODAndDesksPolicy',
    'Get-CsTeamsBYODAndDesksPolicy',
    'Remove-CsTeamsBYODAndDesksPolicy',
    'Set-CsTeamsBYODAndDesksPolicy',
    'Grant-CsTeamsBYODAndDesksPolicy',

    'Get-CsTeamsTenantAbuseConfiguration',
    'Set-CsTeamsTenantAbuseConfiguration',

    'Get-CsTeamsEducationAssignmentsAppPolicy',
    'Set-CsTeamsEducationAssignmentsAppPolicy',

    'Get-CsPrivacyConfiguration',
    'Set-CsPrivacyConfiguration',

    'Get-CsTeamsNotificationAndFeedsPolicy',
    'Set-CsTeamsNotificationAndFeedsPolicy',
    'Remove-CsTeamsNotificationAndFeedsPolicy'
    
    'Get-CsTeamsClientConfiguration',
    'Set-CsTeamsClientConfiguration',
    
    'Get-CsTeamsAcsFederationConfiguration',
    'Set-CsTeamsAcsFederationConfiguration'
)

# Variables to export from this module
VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{}

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''
}
# SIG # Begin signature block
