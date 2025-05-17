-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a03_luac 

-- params : ...
-- function num : 0
GetRuleInfo = function()
  -- function num : 0_0
  local l_1_0 = {}
  l_1_0.Name = "Block Process Creations originating from PSExec & WMI commands"
  l_1_0.Description = "Windows Defender Exploit Guard detected remoting application (wmiprvse and psexesvc) creating child process"
  l_1_0.NotificationDedupingInterval = 120
  l_1_0.NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  return l_1_0
end

GetMonitoredLocations = function()
  -- function num : 0_1
  local l_2_0 = {}
  l_2_0["%windir%\\system32\\wbem\\WmiPrvSE.exe"] = 2
  l_2_0["%windir%\\PSEXESVC.exe"] = 2
  return 1, l_2_0
end

GetPathExclusions = function()
  -- function num : 0_2
  local l_3_0 = {}
  l_3_0["%windir%\\system32\\wbem\\WmiPrvSE.exe"] = 2
  l_3_0["%windir%\\system32\\wbem\\mofcomp.exe"] = 2
  l_3_0["%windir%\\system32\\svchost.exe"] = 2
  l_3_0["%windir%\\system32\\WerFault.exe"] = 2
  l_3_0["%windir%\\system32\\wuauclt.exe"] = 2
  l_3_0["%windir%\\system32\\gpupdate.exe"] = 2
  l_3_0["%windir%\\SysWOW64\\wbem\\WmiPrvSE.exe"] = 2
  l_3_0["%windir%\\SysWOW64\\wbem\\mofcomp.exe"] = 2
  l_3_0["%windir%\\SysWOW64\\svchost.exe"] = 2
  l_3_0["%windir%\\SysWOW64\\WerFault.exe"] = 2
  l_3_0["%windir%\\SysWOW64\\wuauclt.exe"] = 2
  l_3_0["%windir%\\SysWOW64\\gpupdate.exe"] = 2
  l_3_0["%windir%\\system32\\spool\\drivers"] = 2
  l_3_0["%windir%\\system32\\fsiso.exe"] = 2
  l_3_0["%windir%\\PSEXESVC.exe"] = 2
  l_3_0["%windir%\\Temp\\*\\DismHost.exe"] = 2
  l_3_0["%windir%\\system32\\Dism\\DismHost.exe"] = 2
  l_3_0["%systemdrive%\\MDE\\Tools\\MDEClientAnalyzer.exe"] = 2
  l_3_0["%systemdrive%\\*\\Tools\\MDATPClientAnalyzer.exe"] = 2
  l_3_0["%systemdrive%\\*\\WDATPDeploy\\MDATPClientAnalyzer\\MDATPClientAnalyzer.exe"] = 2
  l_3_0["%windir%\\CCM\\Ccm32BitLauncher.exe"] = 2
  return l_3_0
end

GetCommandLineExclusions = function()
  -- function num : 0_3
  local l_4_0 = ".:\\\\windows\\\\ccmcache\\\\.+"
  local l_4_1 = ".:\\\\windows\\\\ccm\\\\systemtemp\\\\.+"
  local l_4_2 = ".:\\\\windows\\\\ccm\\\\sensorframework\\\\.+"
  local l_4_3 = ".:\\\\windows\\\\ccm\\\\signedscripts\\\\.+"
  local l_4_4 = "cmd[^\\s]*\\s+/c\\s+\\\"chcp\\s+65001\\s+&\\s+.:\\\\windows\\\\system32\\\\inetsrv\\\\appcmd\\.exe\\s+list[^>]+>\\s+\\\"\\\\\\\\127\\.0\\.0\\.1\\\\.\\$\\\\temp\\\\[^\\\"]+\\\"\\s+2>&1\\\""
  local l_4_5 = "\\s+(.:\\\\windows\\\\temp\\\\)?nessus_[^\\.\\s]+\\.txt[\\\"\\\'\\;\\s]*$"
  local l_4_6 = "\\\"?.:\\\\windows\\\\system32\\\\sc\\.exe\\\"?\\s+start\\s+tenable_mw_scan\\s+output=nessus_[^\\s\\.]+\\.txt"
  local l_4_7 = "\\\"?.:\\\\windows\\\\system32\\\\cmd\\.exe\\\"?\\s+/c\\s+echo\\s+nessus_cmd_[^\\s=]+=_start\\s+>>\\s+\\\"?.:\\\\windows\\\\temp\\\\nessus_"
  local l_4_8 = {}
  l_4_8[l_4_0] = 0
  l_4_8[l_4_1] = 0
  l_4_8[l_4_2] = 0
  l_4_8[l_4_3] = 0
  l_4_8[l_4_4] = 0
  l_4_8[l_4_5] = 0
  l_4_8[l_4_6] = 0
  l_4_8[l_4_7] = 0
  do
    if (versioning.GetEngineBuild)() >= 24080 then
      local l_4_9 = (versioning.GetOrgID)()
      if l_4_9 ~= nil and l_4_9 ~= "" then
        l_4_9 = (string.lower)(l_4_9)
      end
      if l_4_9 == "3216b490-71ee-4a94-b228-13b1c1582e3b" then
        l_4_8["\\\"?[a-z]:\\\\windows\\\\system32\\\\msiexec\\.exe\\\"?\\s+\\/x\\s+\\{[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\}\\s+\\/q.*\\s+\\/qn"] = 0
      else
        l_4_8["\\\"?[a-z]:\\\\windows\\\\system32\\\\msiexec\\.exe\\\"?\\s+.+\\{[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\-[0-9a-f]+\\}\\s+.+[a-z]:\\\\windows\\\\temp\\\\nmwlogs\\\\wvdapps\\\\[^\\\\\\.]+\\.log"] = 0
      end
    end
    return l_4_8
  end
end

GetCommandLineRegExpList = function()
  -- function num : 0_4
  local l_5_0 = "cmd(\\.exe)?\\s+\\/c\\s+\\\"*(.:\\\\.+\\.cmd)\\\"*"
  local l_5_1 = "cmd(\\.exe)?\\\"?\\s+\\/c\\s+\\\"?(.:\\\\.+\\.exe)\\\"?"
  local l_5_2 = "msiexec(\\.exe)?\\\"?[\\s/a-z]+\\\"?([a-z]:\\\\.+\\.msi)\\\"?"
  local l_5_3 = {}
  l_5_3[l_5_0] = 0
  l_5_3[l_5_1] = 0
  l_5_3[l_5_2] = 0
  return l_5_3
end


