-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspTamperingScript
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpIsPowerShellAMSIScan & (SuspTamperingScript | AGGR:PowerShell/DisableAntiSpyware | AGGR:PowerShell/DisableRealTimeMonitoring | AGGR:PowerShell/DisableControlledFolderAccess | AGGR:PowerShell/DisableBehaviorMonitoring | AGGR:PowerShell/DisableArchiveScanning | AGGR:PowerShell/DisableBLockAtFirstSeen | AGGR:PowerShell/DisableIOAVProtection | AGGR:PowerShell/DisablePrivacyMode | AGGR:PowerShell/DisableIntrusionPreventionSystem | AGGR:PowerShell/DisableScriptScanning | AGGR:PowerShell/UninstallWindowsFeature)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
if l_0_2 == nil then
  l_0_2 = {}
end
local l_0_3 = mp.GetParentProcInfo(l_0_0)
if l_0_3 ~= nil then
  local l_0_4 = mp.GetProcessCommandLine(l_0_3.ppid)
  local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_4)
  if l_0_5 == nil then
    l_0_5 = {}
  end
  l_0_2 = table_dedup(table_merge(l_0_2, l_0_5))
end
local l_0_6 = {
  [".bat"] = true,
  [".cmd"] = true,
  [".ps1"] = true
}
local l_0_7 = 4
local l_0_8 = {
  ":\\saw\\system\\sawhealthcheck.ps1$",
  ":\\saw\\user\\sawhealthcheck.ps1$",
  "\\microsoft intune management extension\\policies\\scripts\\",
  ":\\windows\\imecache\\healthscripts\\.+%.ps1$",
  "\\vdi_scripts\\defenderatp\\defenderatp.ps1$",
  ":\\agent\\enableagent.ps1$",
  ":\\programdata\\amazon\\ssm\\.+\\runpowershellscript\\_script.ps1$",
  ":\\svcfab\\_app\\.+\\svc\\setupnightwatch.bat$",
  ":\\work\\cloudtest\\preconfig.cmd$",
  "%w\\bin\\defender%-exclusions.ps1$"
}
for l_0_9, l_0_10 in ipairs(l_0_2) do
  l_0_10 = MpCommon.ExpandEnvironmentVariables(l_0_10)
  if l_0_7 < string.len(l_0_10) then
    local l_0_11 = l_0_10:lower()
    local l_0_12 = string.sub(l_0_11, -l_0_7)
    if l_0_6[l_0_12] then
      local l_0_13 = false
      for l_0_14, l_0_15 in pairs(l_0_8) do
        if string.find(l_0_11, l_0_15, 1, false) then
          l_0_13 = true
          break
        end
      end
      if not l_0_13 and sysio.IsFileExists(l_0_10) then
        AppendToRollingQueue("ShellScripts", l_0_0 .. ",FilePath:" .. l_0_10, l_0_10, 3600, 100, 1)
        mp.ReportLowfi(l_0_10, 4064046355, {
          ReportingSig = "LUA:SuspTamperingScript"
        })
      end
    end
  end
end
return mp.CLEAN
