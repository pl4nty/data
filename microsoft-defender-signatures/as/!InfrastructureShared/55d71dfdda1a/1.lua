-- Threat: !InfrastructureShared
-- Name: 55d71dfdda1a
-- Type: 21
-- Includes: ResearchData

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 and l_0_2.ppid then
  MpCommon.BmTriggerSig(l_0_2.ppid, "Tampering_PPL_ClipUpMisuse", l_0_1)
end
set_research_data("TamperingCmd", MpCommon.Base64Encode(l_0_1), false)
return mp.INFECTED
