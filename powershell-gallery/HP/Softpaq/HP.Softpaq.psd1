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

  RootModule = 'HP.Softpaq.psm1'
  #FullModuleVersion = '1.8.5.1220'
  ModuleVersion = '1.8.5'
  GUID = '994EF32D-25FA-4903-88EF-98D47F052675'
  Author = 'HP Development Company, L.P.'
  CompanyName = 'HP Inc'
  Copyright = '(C) Copyright 2018-2025 HP Development Company, L.P.'
  Description = 'Softpaq management module for HP Client Management Script Library'
  PowerShellVersion = '5.1'
  FunctionsToExport = 
    'Clear-HPSoftpaqCache',
    'Get-HPSoftpaq',
    'Get-HPSoftpaqList',
    'Get-HPImageAssistantUpdateInfo',
    'Install-HPImageAssistant',
    'Get-HPSoftpaqMetadata',
    'Get-HPSoftpaqMetadataFile',
    'Out-HPSoftpaqField',
    'New-HPDriverPack',
    'New-HPBuildDriverPack',
    'New-HPUWPDriverPack'
  
  AliasesToExport = 
    'Clear-SoftpaqCache',
    'Get-Softpaq',
    'Get-SoftpaqList',
    'Get-SoftpaqMetadata',
    'Get-SoftpaqMetadataFile',
    'Out-SoftpaqField'
  
  PrivateData = @{
    PSData = @{
        LicenseUri = 'https://developers.hp.com/node/11493'
        RequireLicenseAcceptance = $true
    } # End of PSData hashtable 
} # End of PrivateData hashtable

}


# SIG # Begin signature block
