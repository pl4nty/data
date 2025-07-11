#
# Module manifest for module 'Microsoft.Teams.PowerShell.TeamsCmdlets'
#
# Generated by: Microsoft Corporation
#
# Updated on: 6/30/2020
#

@{
# Script module or binary module file associated with this manifest.
RootModule = './Microsoft.Teams.PowerShell.TeamsCmdlets.psm1'

# Version number of this module.
# There's a string replace for the actual module version in the build pipeline
ModuleVersion = '1.5.0'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = '3dfbed68-91ab-432e-b8bf-affe360d2c2f'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Teams cmdlets sub module for Windows PowerShell and PowerShell Core.

For more information, please visit the following: https://docs.microsoft.com/MicrosoftTeams/teams-powershell-overview'

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
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = @('GetTeamSettings.format.ps1xml')

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @(
    'Add-TeamChannelUser'
    ,'Add-TeamUser'
    ,'Get-AssociatedTeam'
    ,'Get-MultiGeoRegion'
    ,'Get-Operation'
    ,'Get-SharedWithTeam'
    ,'Get-SharedWithTeamUser'
    ,'Get-Team'
    ,'Get-TeamAllChannel'
    ,'Get-TeamChannel'
    ,'Get-TeamChannelUser'
    ,'Get-TeamIncomingChannel'
    ,'Get-TeamsApp'
    ,'Get-TeamUser'
    ,'Get-M365TeamsApp'
    ,'Get-AllM365TeamsApps'
    ,'Get-M365UnifiedTenantSettings'
    ,'Get-M365UnifiedCustomPendingApps'
    ,'New-Team'
    ,'New-TeamChannel'
    ,'New-TeamsApp'
    ,'Remove-SharedWithTeam'
    ,'Remove-Team'
    ,'Remove-TeamChannel'
    ,'Remove-TeamChannelUser'
    ,'Remove-TeamsApp'
    ,'Remove-TeamUser'
    ,'Set-Team'
    ,'Set-TeamArchivedState'
    ,'Set-TeamChannel'
    ,'Set-TeamPicture'
    ,'Set-TeamsApp'
    ,'Update-M365TeamsApp'
    ,'Update-M365UnifiedTenantSettings'
    ,'Update-M365UnifiedCustomPendingApp'
    ,'Add-TeamsAppInstallation'
    ,'Get-TeamsAppInstallation'
    ,'Get-TeamTargetingHierarchyStatus'
    ,'Remove-TeamsAppInstallation'
    ,'Remove-TeamTargetingHierarchy'
    ,'Set-TeamTargetingHierarchy'
    ,'Update-TeamsAppInstallation'
    ,'Get-LicenseReportForChangeNotificationSubscription'
   )

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''
}
# SIG # Begin signature block
