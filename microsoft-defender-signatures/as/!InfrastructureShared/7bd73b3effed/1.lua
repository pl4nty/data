-- Threat: !InfrastructureShared
-- Name: 7bd73b3effed
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 and l_0_0.ppid then
  local l_0_1 = mp.GetScannedPPID()
  if l_0_1 == "" or l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = mp.GetProcessCommandLine(l_0_1)
  MpCommon.BmTriggerSig(l_0_0.ppid, "LLMPrompt_Malicious_B", l_0_2 or "")
  return mp.INFECTED
end
return mp.CLEAN
