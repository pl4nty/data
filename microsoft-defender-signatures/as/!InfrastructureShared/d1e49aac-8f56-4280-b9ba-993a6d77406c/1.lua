-- Threat: !InfrastructureShared
-- Name: d1e49aac-8f56-4280-b9ba-993a6d77406c
-- Type: 25

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

function GetRuleInfo()
  return {
    Name = "Block Process Creations originating from PSExec & WMI commands",
    Description = "Windows Defender Exploit Guard detected remoting application (wmiprvse and psexesvc) creating child process",
    NotificationDedupingInterval = 120, NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end

function GetMonitoredLocations()
  return 1, { ["%windir%\\system32\\wbem\\WmiPrvSE.exe"] = 2, ["%windir%\\PSEXESVC.exe"] = 2 }
end

function GetPathExclusions()
  return {
    ["%windir%\\system32\\wbem\\WmiPrvSE.exe"] = 2, ["%windir%\\system32\\wbem\\mofcomp.exe"] = 2,
    ["%windir%\\system32\\svchost.exe"] = 2, ["%windir%\\system32\\WerFault.exe"] = 2,
    ["%windir%\\system32\\wuauclt.exe"] = 2, ["%windir%\\system32\\gpupdate.exe"] = 2,
    ["%windir%\\SysWOW64\\wbem\\WmiPrvSE.exe"] = 2, ["%windir%\\SysWOW64\\wbem\\mofcomp.exe"] = 2,
    ["%windir%\\SysWOW64\\svchost.exe"] = 2, ["%windir%\\SysWOW64\\WerFault.exe"] = 2,
    ["%windir%\\SysWOW64\\wuauclt.exe"] = 2, ["%windir%\\SysWOW64\\gpupdate.exe"] = 2,
    ["%windir%\\system32\\spool\\drivers"] = 2, ["%windir%\\system32\\fsiso.exe"] = 2,
    ["%windir%\\PSEXESVC.exe"] = 2, ["%windir%\\Temp\\*\\DismHost.exe"] = 2,
    ["%windir%\\system32\\Dism\\DismHost.exe"] = 2,
    ["%systemdrive%\\MDE\\Tools\\MDEClientAnalyzer.exe"] = 2,
    ["%systemdrive%\\*\\Tools\\MDATPClientAnalyzer.exe"] = 2,
    ["%systemdrive%\\*\\WDATPDeploy\\MDATPClientAnalyzer\\MDATPClientAnalyzer.exe"] = 2,
    ["%windir%\\CCM\\Ccm32BitLauncher.exe"] = 2
  }
end

function GetCommandLineExclusions()
  local r4_0 = {
    [".:\\\\windows\\\\ccmcache\\\\.+"] = 0, [".:\\\\windows\\\\ccm\\\\systemtemp\\\\.+"] = 0,
    [".:\\\\windows\\\\ccm\\\\sensorframework\\\\.+"] = 0,
    [".:\\\\windows\\\\ccm\\\\signedscripts\\\\.+"] = 0,
    ['cmd[^\\s]*\\s+/c\\s+\\"chcp\\s+65001\\s+&\\s+.:\\\\windows\\\\system32\\\\inetsrv\\\\appcmd\\.exe\\s+list[^>]+>\\s+\\"\\\\\\\\127\\.0\\.0\\.1\\\\.\\$\\\\temp\\\\[^\\"]+\\"\\s+2>&1\\"'] = 0,
    ["\\s+(.:\\\\windows\\\\temp\\\\)?nessus_[^\\.\\s]+\\.txt[\\\"\\'\\;\\s]*$"] = 0,
    ['\\"?.:\\\\windows\\\\system32\\\\sc\\.exe\\"?\\s+start\\s+tenable_mw_scan\\s+output=nessus_[^\\s\\.]+\\.txt'] = 0,
    ['\\"?.:\\\\windows\\\\system32\\\\cmd\\.exe\\"?\\s+/c\\s+echo\\s+nessus_cmd_[^\\s=]+=_start\\s+>>\\s+\\"?.:\\\\windows\\\\temp\\\\nessus_'] = 0,
    ['cmd\\.exe\\"?\\s+/c\\s+cd\\s+.+\\\\program files\\\\vmware\\\\vmware tools\\s+&&\\s+vmtoolsd\\s+--version\\s+>\\s+\\\\\\\\\\d+\\.\\d+\\.\\d+\\.\\d+\\\\admin\\$\\\\vmware_vcenter_imds_response\\.txt'] = 0
  }
  if versioning.GetEngineBuild() >= 24080 then
    local r4_1 = versioning.GetOrgID()
    if r4_1 ~= nil and string.lower(r4_1) == "3216b490-71ee-4a94-b228-13b1c1582e3b" then
      r4_0['\\"?[a-z]:\\\\windows\\\\system32\\\\msiexec\\.exe\\"?\\s+\\/x\\s+\\{[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\}\\s+\\/q.*\\s+\\/qn'] = 0
    else
      r4_0['\\"?[a-z]:\\\\windows\\\\system32\\\\msiexec\\.exe\\"?\\s+.+\\{[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\}\\s+.+[a-z]:\\\\windows\\\\temp\\\\nmwlogs\\\\wvdapps\\\\[^\\\\\\.]+\\.log'] = 0
    end
  end
  return r4_0
end

function GetCommandLineRegExpList()
  local r5_0, r5_1, r5_2, r5_3, r5_4, r5_5, r5_6, r5_7 = 'cmd\\"?\\s+\\/c\\s+\\"*([a-z]:\\\\.+\\.exe)\\"?', 'cmd\\.exe\\"?\\s+\\/c\\s+\\"*([a-z]:\\\\.+\\.exe)\\"?', 'cmd\\"?\\s+\\/c\\s+\\"*([a-z]:\\\\.+\\.cmd)\\"?', 'cmd\\.exe\\"?\\s+\\/c\\s+\\"*([a-z]:\\\\.+\\.cmd)\\"?', 'cmd\\"?\\s+\\/c\\s+\\"*([a-z]:\\\\.+\\.bat)\\"?', 'cmd\\.exe\\"?\\s+\\/c\\s+\\"*([a-z]:\\\\.+\\.bat)\\"?', 'msiexec\\"?[\\s/a-z]+\\"*([a-z]:\\\\.+\\.msi)\\"?', 'msiexec\\.exe\\"?[\\s/a-z]+\\"*([a-z]:\\\\.+\\.msi)\\"?'
  return {
    [r5_0] = 0, [r5_1] = 0, [r5_2] = 0, [r5_3] = 0, [r5_4] = 0, [r5_5] = 0, [r5_6] = 0, [r5_7] = 0
  }
end
