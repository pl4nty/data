-- Threat: !InfrastructureShared
-- Name: !#DisableDefender
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & SCPT:PowerShell/SetMpPreference

local l_0_0 = 0
if mp.get_mpattribute("AGGR:PowerShell/DisableIntrusionPreventionSystem") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("AGGR:PowerShell/DisableIOAVProtection") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("AGGR:PowerShell/DisableRealTimeMonitoring") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("AGGR:PowerShell/DisableScriptScanning") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("AGGR:PowerShell/DisableControlledFolderAccess") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("AGGR:PowerShell/SubmitSamplesConsent") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:PowerShell/SetNetProtectAudit") then
  l_0_0 = l_0_0 + 1
end
if mp.get_mpattribute("SCPT:PowerShell/DisableMAPSReport") then
  l_0_0 = l_0_0 + 1
end
if 2 <= l_0_0 and l_0_0 < 10 then
  mp.set_mpattribute("Disable_" .. l_0_0 .. "_WDFunctions")
end
if 3 < l_0_0 and l_0_0 < 10 then
  mp.set_mpattribute("Disable_Multiple_WDFunctions")
end
return mp.CLEAN
