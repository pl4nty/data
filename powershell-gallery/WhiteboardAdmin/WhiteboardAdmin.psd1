#
# Module manifest for module 'WhiteboardAdmin'
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'WhiteboardAdmin.psm1'

# Version number of this module.
ModuleVersion = '1.13.8'

# ID used to uniquely identify this module
GUID = 'CC24F7D4-4CF7-46D3-BD87-30A3D44ECF96'

# Author of this module
Author = 'Microsoft'

# Company or vendor of this module
CompanyName = 'Microsoft'

# Copyright statement for this module
Copyright = '(c) 2023 Microsoft. All rights reserved.'

# Description of the functionality provided by this module
Description = "Administration cmdlets for Microsoft Whiteboard."

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
FunctionsToExport = @(
    'Get-Whiteboard', 
    'Set-WhiteboardOwner', 
    'Invoke-TransferAllWhiteboards', 
    'Remove-Whiteboard', 
    'Get-WhiteboardOwners', 
    'Get-WhiteboardSettings', 
    'Set-WhiteboardSettings', 
    'Get-WhiteboardsForTenant',
    'Restore-Whiteboard',
    'Get-WhiteboardsMigrated',
    'Get-WhiteboardsForTenantMigrated',
    'Get-OriginalFluidWhiteboardsForTenant',
    'Get-OriginalFluidWhiteboards',
    'Get-WhiteboardMigrationMapping')

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# Load Azure AD assemblies from the module root
RequiredAssemblies = @(
    'packages/Microsoft.Identity.Client.4.44.0/lib/net45/Microsoft.Identity.Client.dll'
)

# List of all files packaged with this module
FileList = @(
    'WhiteboardAdmin.psm1',
    'packages/Microsoft.Identity.Client.4.44.0/lib/net45/Microsoft.Identity.Client.dll',
    'packages/Microsoft.Identity.Client.4.44.0/lib/net45/Microsoft.Identity.Client.xml'
)

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('whiteboard', 'office')

        # A URL to the license for this module.
        LicenseUri = 'https://raw.githubusercontent.com/MicrosoftDocs/office-docs-powershell/master/whiteboard/docs-conceptual/LICENSE.txt'

        # ReleaseNotes of this module
        ReleaseNotes = @(
            '* Internal fixes to improve performance and reliability')
    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
HelpInfoURI = 'https://docs.microsoft.com/en-us/powershell/whiteboard/?view=whiteboard-ps'
}

# SIG # Begin signature block
