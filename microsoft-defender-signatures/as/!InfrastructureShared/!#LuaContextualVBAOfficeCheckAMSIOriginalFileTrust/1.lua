-- Threat: !InfrastructureShared
-- Name: !#LuaContextualVBAOfficeCheckAMSIOriginalFileTrust
-- Type: 13
-- MpAttributes: MpIsOfficeVbaAMSIScan

if not mp.IsHipsRuleEnabled("92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
if l_0_0 and sysio.IsPathAVExcluded(l_0_1, false) then
  mp.set_mpattribute("Lua:OfficeVBASkipKnownCleanOriginalFile")
end
return mp.CLEAN
