-- Threat: !InfrastructureShared
-- Name: 6fd7cd103af5
-- Type: 21

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
  MpCommon.BmTriggerSig(l_0_2.ppid, "Tampering_FW_All_Profiles", l_0_1)
end
return mp.INFECTED
