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

  RootModule = 'HP.Notifications.psm1'
  #FullModuleVersion = '1.8.5.1220'
  ModuleVersion = '1.8.5'
  GUID = 'b066583c-1b04-40d7-86a6-196dfd22dfbb'
  Author = 'HP Development Company, L.P.'
  CompanyName = 'HP Inc'
  Copyright = '(C) Copyright 2018-2025 HP Development Company, L.P.'
  Description = 'Notifications utility module'
  PowerShellVersion = '5.1'

  FunctionsToExport =
  'Invoke-HPNotification',
  'Invoke-HPNotificationFromXML',
  'Invoke-HPRebootNotification',
  'Invoke-HPPrivateNotificationAsUser',
  'Invoke-HPPrivateRebootNotificationAsUser',
  'Register-HPNotificationApplication',
  'Unregister-HPNotificationApplication'

  AliasesToExport =
  'Invoke-RebootNotification',
  'Register-NotificationApplication',
  'Unregister-NotificationApplication'

  PrivateData = @{
      PSData = @{
          LicenseUri = 'https://developers.hp.com/node/11493'
          RequireLicenseAcceptance = $true
      } # End of PSData hashtable
  } # End of PrivateData hashtable


}
# SIG # Begin signature block
