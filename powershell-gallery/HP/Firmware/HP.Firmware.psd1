#
#  Copyright 2018-2024 HP Development Company, L.P.
#  All Rights Reserved.
#
# NOTICE:  All information contained herein is, and remains the property of HP Inc.
#
# The intellectual and technical concepts contained herein are proprietary to HP Inc
# and may be covered by U.S. and Foreign Patents, patents in process, and are protected by
# trade secret or copyright law. Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained from HP Inc.


@{

  # Script module or binary module file associated with this manifest.
  RootModule = 'HP.Firmware.psm1'
  NestedModules = @(
    'HP.Firmware.SureView',
    'HP.Firmware.SecurePlatform',
    'HP.Firmware.SureRecover',
    'HP.Firmware.SureAdmin'
  )

  # Version number of this module.
  #FullModuleVersion = '1.8.1.898'
  ModuleVersion = '1.8.1'

  # ID used to uniquely identify this module
  GUID = '9c46d615-4396-4e75-9eea-908625f0484e'

  # Author of this module
  Author = 'HP Development Company, L.P.'

  # Company or vendor of this module
  CompanyName = 'HP Inc'

  # Copyright statement for this module
  Copyright = '(C) Copyright 2018-2024 HP Development Company, L.P.'

  # Description of the functionality provided by this module
  Description = 'Firmware access module for HP Client Management Script Library'

  # Minimum version of the Windows PowerShell engine required by this module
  PowerShellVersion = '5.1'

  FunctionsToExport =
    'Clear-HPFirmwareBootLogo',
    'Get-EFIPartitionPath',
    'Get-HPFirmwareAuditLog',
    'Get-HPFirmwareBootLogoIsActive',
    'Get-HPPrivateRetailConfiguration',
    'Get-HPSecurePlatformState',
    'Get-HPSureRecoverReimagingDeviceDetails',
    'Get-HPSureRecoverState',
    'Get-HPSureViewState',
    'Get-HPSureAdminState',
    'New-HPSureAdminEnablePayload',
    'New-HPSureAdminDisablePayload',
    'Convert-HPSureAdminCertToQRCode',
    'Send-HPSureAdminLocalAccessKeyToKMS',
    'Clear-HPSureAdminKMSAccessToken',
    'New-HPSureAdminLocalAccessKeyProvisioningPayload',
    'New-HPSureAdminBIOSSettingValuePayload',
    'New-HPSureAdminSettingDefaultsPayload',
    'New-HPSureAdminBIOSSettingsListPayload',
    'New-HPSureAdminFirmwareUpdatePayload',
    'Invoke-HPSureRecoverTriggerUpdate',
    'New-HPSecurePlatformDeprovisioningPayload',
    'New-HPSecurePlatformEndorsementKeyProvisioningPayload',
    'New-HPSecurePlatformSigningKeyProvisioningPayload',
    'New-HPSureRecoverConfigurationPayload',
    'New-HPSureRecoverDeprovisionPayload',
    'New-HPSureRecoverImageConfigurationPayload',
    'New-HPSureRecoverSchedulePayload',
    'New-HPSureRecoverTriggerRecoveryPayload',
    'Set-HPFirmwareBootLogo',
    'Set-HPPrivateRetailConfiguration',
    'Set-HPSecurePlatformPayload',
    'Set-HPSureViewState',
    'Test-HPFirmwareFlashSupported',
    'Test-HPSureViewIsSupported',
    'Test-OSBitness',
    'Update-HPFirmware',
    'Set-HPPrivateFirmwareUpdatePayload',
    'Write-HPFirmwarePasswordFile',
    'Add-HPSureAdminSigningKeyToKMS',
    'Remove-HPSureAdminSigningKeyFromKMS',
    'Add-HPSureAdminEndorsementKeyToKMS',
    'Remove-HPSureAdminEndorsementKeyFromKMS',
    'Invoke-HPPrivateRemoteSignData',
    'Get-HPSureAdminKeyId',
    'Add-HPSureAdminDevicePermissions',
    'Set-HPSureAdminDevicePermissions',
    'Get-HPSureAdminDevicePermissions',
    'Remove-HPSureAdminDevicePermissions',
    'Edit-HPSureAdminDevicePermissions',
    'Search-HPSureAdminDevicePermissions',
    'New-HPSureRecoverFailoverConfigurationPayload',
    'Get-HPSureRecoverFailoverConfiguration',
    'Get-HPSureAdminKMSCapabilities',
    'Get-HPPrivateSureAdminKMSAccessToken'

    PrivateData = @{
      PSData = @{
          LicenseUri = 'https://developers.hp.com/node/11493'
          RequireLicenseAcceptance = $true
      } # End of PSData hashtable
  } # End of PrivateData hashtable


}


# SIG # Begin signature block
