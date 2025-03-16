#
#  Copyright 2018-2024 HP Development Company, L.P.
#  All Rights Reserved.
#
# NOTICE:  All information contained herein is, and remains the property of HP Development Company, L.P.
#
# The intellectual and technical concepts contained herein are proprietary to HP Development Company, L.P
# and may be covered by U.S. and Foreign Patents, patents in process, and are protected by
# trade secret or copyright law. Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained from HP Development Company, L.P.



@{

  RootModule = 'HP.ClientManagement.psm1'
  NestedModules = @(
    'HP.UEFI'
  )
  #FullModuleVersion = '1.8.1.898'
  ModuleVersion = '1.8.1'
  GUID = 'e5f40402-f5b0-42f9-b10b-28910aacdf5b'
  Author = 'HP Development Company, L.P.'
  CompanyName = 'HP Inc'
  Copyright = '(C) Copyright 2018-2024 HP Development Company, L.P.'
  Description = 'Device and BIOS management module for HP Client Management Script Library'
  PowerShellVersion = '5.1'

  FunctionsToExport =
    'Clear-HPBIOSPowerOnPassword',
    'Clear-HPBIOSSetupPassword',
    'Get-HPBIOSAuthor',
    'Get-HPBIOSPowerOnPasswordIsSet',
    'Get-HPBIOSSetting',
    'Get-HPBIOSSettingsList',
    'Get-HPBIOSSettingValue',
    'Get-HPBIOSSetupPasswordIsSet',
    'Get-HPBIOSUpdates',
    'Get-HPBIOSUUID',
    'Get-HPBIOSVersion',
    'Get-HPDeviceAssetTag',
    'Get-HPDeviceBootInformation',
    'Get-HPDeviceDetails',
    'Get-HPDeviceManufacturer',
    'Get-HPDeviceModel',
    'Get-HPDevicePartNumber',
    'Get-HPDeviceProductID',
    'Get-HPDeviceSerialNumber',
    'Get-HPDeviceUptime',
    'Get-HPDeviceUUID',
    'Set-HPPrivateBIOSSettingValuePayload',
    'Set-HPBIOSPowerOnPassword',
    'Set-HPBIOSSettingDefaults',
    'Set-HPPrivateBIOSSettingDefaultsPayload',
    'Set-HPBIOSSettingValue',
    'Set-HPBIOSSettingValuesFromFile',
    'Set-HPBIOSSetupPassword',
    'Get-HPUEFIVariable',
    'Set-HPUEFIVariable',
    'Remove-HPUEFIVariable',
    'Get-HPBIOSWindowsUpdate',
    'Add-HPBIOSWindowsUpdateScripts',
    'Add-PSScriptsEntry',
    'Remove-PSScriptsEntry',
    'Get-HPCMSLEnvironment'

    PrivateData = @{
      PSData = @{
          LicenseUri = 'https://developers.hp.com/node/11493'
          RequireLicenseAcceptance = $true
      } # End of PSData hashtable
  } # End of PrivateData hashtable


}


# SIG # Begin signature block
