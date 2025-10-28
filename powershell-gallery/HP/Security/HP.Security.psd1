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

    RootModule = 'HP.PlatformCertificate.Validation.PowerShell.dll'

    #FullModuleVersion = '1.8.5.1220'
    ModuleVersion = '1.8.5'
    GUID = '2ad9a913-8e17-46e1-aea1-b4056b4014c7'
    Author = 'HP Development Company, L.P.'
    CompanyName = 'HP Inc'
    Copyright = '(C) Copyright 2018-2025 HP Development Company, L.P.'
    Description = 'Security module for HP Client Management Script Library'
    PowerShellVersion = '5.1'

    FunctionsToExport =
      'Get-HPPlatformCertificateData',
      'Get-HPPlatformData',
      'Invoke-HPCertificateChainValidation',
      'Invoke-HPPlatformIntegrityCheck',
      'Invoke-HPTPMCredentialValidation'

      PrivateData = @{
        PSData = @{
            LicenseUri = 'https://developers.hp.com/node/11493'
            RequireLicenseAcceptance = $true
        } # End of PSData hashtable
    } # End of PrivateData hashtable


  }

# SIG # Begin signature block
