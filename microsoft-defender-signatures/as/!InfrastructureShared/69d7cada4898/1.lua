-- Threat: !InfrastructureShared
-- Name: 69d7cada4898
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper, AppomalyHelpers

local l_0_0 = mp.GetParentProcInfo()
local l_0_1 = {}
l_0_1.Parents = add_parents_mp()
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
local l_0_4, l_0_5 = MpCommon.StringRegExpSearch("(?i)(?:verclsid|xwizard|rundll32).*\\{(.*?)\\}", l_0_3)
if not l_0_5 then
  return mp.CLEAN
end
l_0_1.CLSID = l_0_5
local l_0_6, l_0_7 = IsKeyInRollingQueue("Potential_COM_Hijacked_CLSIDs", string.lower(l_0_5))
if l_0_6 then
  l_0_1.CLSID_BM = l_0_7
  local l_0_8 = safeJsonSerialize(l_0_1)
  set_research_data("NewServiceRegistered_LoadsBeforeAV", MpCommon.Base64Encode(l_0_8), false)
  MpCommon.BmTriggerSig(l_0_0.ppid, "APML_SuspCLSIDExec_A", l_0_8)
  return mp.INFECTED
end
return mp.CLEAN
