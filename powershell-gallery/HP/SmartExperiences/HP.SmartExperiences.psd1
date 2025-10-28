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

  RootModule = 'HP.SmartExperiences.psm1'
  #FullModuleVersion = '1.8.5.1220'
  ModuleVersion = '1.8.5'
  GUID = '04c79fde-7cc7-49e4-b11b-d2892e11f6d1'
  Author = 'HP Development Company, L.P.'
  CompanyName = 'HP Inc'
  Copyright = '(C) Copyright 2018-2025 HP Development Company, L.P.'
  Description = 'SmartExperiences module'
  PowerShellVersion = '5.1'

  FunctionsToExport =
  'Set-HPeAISettingValue',
  'Get-HPeAISettingValue',
  'Test-HPSmartExperiencesIsSupported',
  'Set-HPeAIManaged',
  'Get-HPeAIManaged'

  PrivateData = @{
      PSData = @{
          LicenseUri = 'https://developers.hp.com/node/11493'
          RequireLicenseAcceptance = $true
      } # End of PSData hashtable
  } # End of PrivateData hashtable


}
# SIG # Begin signature block
