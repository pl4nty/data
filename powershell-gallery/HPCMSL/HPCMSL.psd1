# 
#  Copyright 2018-2025 HP Development Company, L.P.
#  All Rights Reserved.
# 
# NOTICE:  All information contained herein is, and remains the property of HP Development Company, L.P.
# 
# The intellectual and technical concepts contained herein are proprietary to HP Development Company, L.P
# and may be covered by U.S. and Foreign Patents, patents in process, and are protected by 
# trade secret or copyright law. Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained from HP Development Company, L.P.

@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
#FullModuleVersion = '1.8.5.1220'
ModuleVersion = '1.8.5'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '2a0d9bf8-be39-4e34-8179-37ad517cfb87'

# Author of this module
Author = 'HP Development Company, L.P.'

# Company or vendor of this module
CompanyName = 'HP Inc'

# Copyright statement for this module
Copyright = '(C) Copyright 2018-2025 HP Development Company, L.P.'

# Description of the functionality provided by this module
Description = 'HP Client Management Script Library'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '5.1'

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
RequiredModules = @(
         @{ModuleName = 'HP.Private'; RequiredVersion = '1.8.5'; GUID = '9F47EFBC-1124-46F3-87AB-F2D15D169CE7' },
         @{ModuleName = 'HP.Utility'; RequiredVersion = '1.8.5'; GUID = 'E8C64CAB-D4F9-4994-AFC8-3DB040B0AEBE' },
         @{ModuleName = 'HP.ClientManagement'; RequiredVersion = '1.8.5'; GUID = 'e5f40402-f5b0-42f9-b10b-28910aacdf5b' },
         @{ModuleName = 'HP.Firmware'; RequiredVersion = '1.8.5'; GUID = '9c46d615-4396-4e75-9eea-908625f0484e' },
         @{ModuleName = 'HP.Repo'; RequiredVersion = '1.8.5'; GUID = 'df713360-19e2-481c-8bcb-f8b4bf70c08b' },
         @{ModuleName = 'HP.Sinks'; RequiredVersion = '1.8.5'; GUID = '6c52dac6-35ee-4c4b-b0f1-a9dba3df70d8' },
         @{ModuleName = 'HP.Softpaq'; RequiredVersion = '1.8.5'; GUID = '994EF32D-25FA-4903-88EF-98D47F052675' },
         @{ModuleName = 'HP.Consent'; RequiredVersion = '1.8.5'; GUID = '1d8ea5a1-45c4-4509-9b16-4019676d1ca8' },
         @{ModuleName = 'HP.Retail'; RequiredVersion = '1.8.5'; GUID = '735c53e1-1a4c-4512-88a6-77137a8ba45a'},
         @{ModuleName = 'HP.Notifications'; RequiredVersion = '1.8.5'; GUID = 'b066583c-1b04-40d7-86a6-196dfd22dfbb'},
         @{ModuleName = 'HP.SmartExperiences'; RequiredVersion = '1.8.5'; GUID = '04c79fde-7cc7-49e4-b11b-d2892e11f6d1'}
         @{ModuleName = 'HP.Displays'; RequiredVersion = '1.8.5'; GUID = '0f71e039-43d1-4a41-9729-108ab24e94ac'}
         @{ModuleName = 'HP.Security'; RequiredVersion = '1.8.5'; GUID = '2ad9a913-8e17-46e1-aea1-b4056b4014c7'}
         @{ModuleName = 'HP.Docks'; RequiredVersion = '1.8.5'; GUID = '281fc451-4c65-4d46-a99a-86e1a46f0f76'}
 )

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
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{
        LicenseUri = 'https://developers.hp.com/node/11493'
        RequireLicenseAcceptance = $true
        Tags = @('HP','client-management','manageability','BIOS','Firmware')

    } # End of PSData hashtable

} # End of PrivateData hashtable


# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}


# SIG # Begin signature block
