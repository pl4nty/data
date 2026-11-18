-- Threat: !InfrastructureShared
-- Name: 36fd7a4f7f2b8
-- Type: 21

local l_0_0 = versioning.GetOrgID()
if l_0_0 and string.lower(l_0_0) == "d7c7c745-195f-4223-9c7a-99fb420fd000" then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 and l_0_1.ppid then
  local l_0_2 = mp.GetScannedPPID()
  if l_0_2 == "" or l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = mp.GetProcessCommandLine(l_0_2)
  MpCommon.BmTriggerSig(l_0_1.ppid, "MSFInternalToolsAbuse", l_0_3)
end
return mp.INFECTED
