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
  RootModule = 'HP.Sinks.psm1'

  # Version number of this module.
  #FullModuleVersion = '1.8.5.1220'
  ModuleVersion = '1.8.5'

  # ID used to uniquely identify this module
  GUID = '6c52dac6-35ee-4c4b-b0f1-a9dba3df70d8'

  # Author of this module
  Author = 'HP Development Company, L.P.'

  # Company or vendor of this module
  CompanyName = 'HP Inc'

  # Copyright statement for this module
  Copyright = '(C) Copyright 2018-2025 HP Development Company, L.P.'


  # Description of the functionality provided by this module
  Description = 'Output sinks module'

  # Minimum version of the Windows PowerShell engine required by this module
  PowerShellVersion = '5.1'

  FunctionsToExport = 
    'Send-ToHPEventLog',
    'Unregister-HPEventLogSink',
    'Register-HPEventLogSink',
    'Send-ToHPSyslog',
    'Send-ToHPCMTraceLog',
    'Log-HPWarning',
    'Log-HPError',
    'Log-HPInfo',
    'Set-HPCMSLLogFormat',
    'Get-HPCMSLLogFormat',
    'Write-HPLogError',
    'Write-HPLogWarning',
    'Write-HPLogInfo'

  AliasesToExport =
    'Send-EventLog',
    'Unregister-EventLogSink',
    'Register-EventLogSink',
    'Send-Syslog',
    'Send-CMTraceLog',
    'Log-Warning',
    'Log-Error',
    'Log-Info',
    'Write-LogError',
    'Write-LogWarning',
    'Write-LogInfo'


  PrivateData = @{
    PSData = @{
        LicenseUri = 'https://developers.hp.com/node/11493'
        RequireLicenseAcceptance = $true
    } # End of PSData hashtable 
} # End of PrivateData hashtable

}


# SIG # Begin signature block
