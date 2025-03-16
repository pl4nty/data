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

  RootModule = 'HP.Retail.psm1'
  #FullModuleVersion = '1.8.1.898'
  ModuleVersion = '1.8.1'
  GUID = '735c53e1-1a4c-4512-88a6-77137a8ba45a'
  Author = 'HP Development Company, L.P.'
  CompanyName = 'HP Inc'
  Copyright = '(C) Copyright 2018-2024 HP Development Company, L.P.'
  Description = 'Retail Point of Sale Module for HP Client Management Script Library'
  PowerShellVersion = '5.1'

  FunctionsToExport = 
    'Get-HPRetailSmartDockConfiguration',
    'Set-HPRetailSmartDockConfiguration'
  
  PrivateData = @{
    PSData = @{
        LicenseUri = 'https://developers.hp.com/node/11493'
        RequireLicenseAcceptance = $true
    } 
} 

}


# SIG # Begin signature block
