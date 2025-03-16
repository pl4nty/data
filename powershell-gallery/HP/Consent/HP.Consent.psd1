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
  RootModule = 'HP.Consent.psm1'
  #FullModuleVersion = '1.8.1.898'
  ModuleVersion = '1.8.1'
  GUID = '1d8ea5a1-45c4-4509-9b16-4019676d1ca8'
  Author = 'HP Development Company, L.P.'
  CompanyName = 'HP Inc'
  Copyright = '(C) Copyright 2018-2024 HP Development Company, L.P.'
  Description = 'Module to manage consent for HP Analytics'
  PowerShellVersion = '5.1'

  FunctionsToExport =
  'Get-HPAnalyticsConsentConfiguration',
  'Set-HPAnalyticsConsentAllowedPurposes',
  'Set-HPAnalyticsConsentTenantID',
  'Set-HPAnalyticsConsentDeviceOwnership'

  PrivateData = @{
    PSData = @{
      LicenseUri = 'https://developers.hp.com/node/11493'
      RequireLicenseAcceptance = $true
    } # End of PSData hashtable 
  } # End of PrivateData hashtable


}


# SIG # Begin signature block
