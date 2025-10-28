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
  RootModule = 'HP.Repo.psm1'


  # Author of this module
  Author = 'HP Development Company, L.P.'

  # ID used to uniquely identify this module
  GUID = 'df713360-19e2-481c-8bcb-f8b4bf70c08b'

  # Version number of this module.
  #FullModuleVersion = '1.8.5.1220'
  ModuleVersion = '1.8.5'

  # Company or vendor of this module
  CompanyName = 'HP Inc'

  # Copyright statement for this module
  Copyright = '(C) Copyright 2018-2025 HP Development Company, L.P.'

  # Description of the functionality provided by this module
  Description = 'Softpaq repository management modules'

  # Minimum version of the Windows PowerShell engine required by this module
  PowerShellVersion = '5.1'


  FunctionsToExport = 
    'Add-HPRepositoryFilter',
    'Add-HPRepositorySyncFailureRecipient',
    'Clear-HPRepositoryNotificationConfiguration',
    'Get-HPRepositoryConfiguration',
    'Get-HPRepositoryInfo',
    'Get-HPRepositoryNotificationConfiguration',
    'Initialize-HPRepository',
    'Invoke-HPRepositoryCleanup',
    'Invoke-HPRepositorySync',
    'Remove-HPRepositoryFilter',
    'Remove-HPRepositorySyncFailureRecipient',
    'Set-HPRepositoryConfiguration',
    'Set-HPRepositoryNotificationConfiguration',
    'Show-HPRepositoryNotificationConfiguration',
    'Test-HPRepositoryNotificationConfiguration',
    'New-HPRepositoryReport'

  AliasesToExport =
    'Add-RepositoryFilter',
    'Add-RepositorySyncFailureRecipient',
    'Clear-RepositoryNotificationConfiguration',
    'Get-RepositoryConfiguration',
    'Get-RepositoryInfo',
    'Get-RepositoryNotificationConfiguration',
    'Initialize-Repository',
    'Invoke-RepositoryCleanup',
    'Invoke-RepositorySync',
    'Remove-RepositoryFilter',
    'Remove-RepositorySyncFailureRecipient',
    'Set-RepositoryConfiguration',
    'Set-RepositoryNotificationConfiguration',
    'Show-RepositoryNotificationConfiguration',
    'Test-RepositoryNotificationConfiguration',
    'New-RepositoryReport'


  PrivateData = @{
    PSData = @{
        LicenseUri = 'https://developers.hp.com/node/11493'
        RequireLicenseAcceptance = $true
    } # End of PSData hashtable 
  } # End of PrivateData hashtable

}


# SIG # Begin signature block
