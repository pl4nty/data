#
# Module manifest for module 'WindowsAutoPilotIntune'
#
# Generated by: Windows Autopilot
#
# Generated on: 4/13/2018
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'WindowsAutoPilotIntune'

# Version number of this module.
ModuleVersion = '5.7'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '7952c22a-a31f-453a-8579-f32ed374126c'

# Author of this module
Author = 'Windows Autopilot'

# Company or vendor of this module
CompanyName = 'Microsoft'

# Copyright statement for this module
Copyright = '(c) 2024 Microsoft. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Sample module to manage AutoPilot devices using the Intune Graph API'

# Minimum version of the Windows PowerShell engine required by this module
# PowerShellVersion = ''

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @('Microsoft.Graph.Intune', 'Microsoft.Graph.Groups', 'microsoft.graph.authentication')

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = '*'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = @'
Version 5.7: Updated to use the newly renamed properties of windowsAutopilotDeploymentProfile 
Version 5.6: Removing the Content_Types xml file
Version 5.5: Fix Connect-MSGraphApp function to use -force while invoking ConvertTo-SecureString to ensure backward compatability to older PS versions. 
Version 5.4: Update Connect-MSGraphApp function to use secure string and fix RequiredModules to include graph auth and groups. 
Version 5.3: Switching back to using Write-Host and fix esp settting bug.  
Version 5.2: Fix \[Content_Types].xml already exists issue.        
Version 5.1: Switch from MSGraph to MgGraph.
Version 5.0: Replaced deprecated orderIdentifier parameter with groupTag parameter.
Version 4.8: Added Connect-MSGraphApp wrapper to simplify app-based authentication.
Version 4.7: Fixed a bug.
Version 4.6: Added Get-AutopilotSyncInfo cmdlet.
Version 4.5: Enabled skip connectivity check option for Hybrid Azure AD Join VPN support.
Version 4.4: Removed Set-AutoPilotDeviceAssignedUser function (workaround no longer needed). Added logic to JSON conversion function.
Version 4.3: Re-added Set-AutoPilotDeviceAssignedUser function to address white glove user assignment issue (temporary workaround)
Version 4.2: Bug fix for not-yet-supported property
Version 4.0: Reworked *-AutopilotProfile functions, added new Get-AutopilotEvent function, added verbose logging to all functions
Version 3.9: Removed logic to install and load dependent modules and instead declared them in the module manifest, for compatibility with Azure Automation
Version 3.8: Replaced Set-AutopilotDeviceAssignedUser with more-capable Set-AutopilotDevice method
Version 3.7: Fixed but with serial number filter on Get-AutopilotDevice
Version 3.6: Added 256 to the default CloudAssignedOobeConfig value to suppress the check for Windows feature updates
Version 3.5: Fixed HttpMethod values for DELETE and PATCH to be upper-case
Version 3.4: Fixed a bug
Version 3.3: Removed duplicate cmdlet
Version 3.2: Added Get-AutopilotProfileAssignedDevices cmdlet to get the list of devices with a specific profile
Version 3.1: Fixed bugs, added expand logic for Autopilot devices
Version 3.0: Modified script to use the Microsoft.Graph.Intune module, added new functions from Damien Van Robaeys
Version 2.7: Added support for using GroupTag instead of OrderID for uploading batches of devices
Version 2.6: Added the ability to read the OrderID value from a CSV file; fixed "Waiting for 1 of" message
Version 2.5: Modified ConvertTo-AutopilotConfigurationJSON to set ZtdCorrelationId to the ID of the profile; added Set-AutoPilotDeviceAssignedUser function (thanks to Oliver Kieselbach)
Version 2.4: Modified ConvertTo-AutopilotConfigurationJSON to properly support available AAD user-driven options
Version 2.3: Added new Invoke-AutopilotSync method (equivalent to clicking "Sync" in the Intune console)
Version 2.2: Added pagination support (thanks to Oliver Kieselbach)
Version 2.1: Fixed syntax issue in connect method
Version 2.0: Added cmdlet help (and fixed the mistake of using 1.41 as a verion, since 1.41 is considered > 1.5 because 41 is greater than 5)
Version 1.4: Added functions to delete a device, to list Autopilot profiles, and to convert Autopilot profiles into JSON.
Version 1.3: Fixed module manifest to export functions
'@
    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}