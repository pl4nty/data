@{
  GUID = '82b0bf19-c5cd-4c30-8db4-b458a4b84495'
  RootModule = './Microsoft.Teams.ConfigAPI.Cmdlets.psm1'
  ModuleVersion = '8.0925.3'
  CompatiblePSEditions = 'Core', 'Desktop'
  Author="Microsoft Corporation"
  CompanyName="Microsoft Corporation"
  Copyright="Copyright (c) Microsoft Corporation.  All rights reserved."
  Description="Microsoft Teams Configuration PowerShell module"
  PowerShellVersion = '5.1'
  DotNetFrameworkVersion = '4.7.2'
  FormatsToProcess = @(
  './Microsoft.Teams.ConfigAPI.Cmdlets.custom.format.ps1xml',
  './Microsoft.Teams.ConfigAPI.Cmdlets.format.ps1xml',
  './SfbRpsModule.format.ps1xml')
  CmdletsToExport = '*'
  FunctionsToExport = '*'
  AliasesToExport = '*'
  PrivateData = @{
    PSData = @{
      # For dev test set Prerelease to preview. This will ensure devtest module get all preview ECS features.
      Prerelease = 'preview'
      Tags = ''
      LicenseUri = ''
      ProjectUri = ''
      ReleaseNotes = ''
    }
  }
}

# SIG # Begin signature block
