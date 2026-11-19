-- Threat: !InfrastructureShared
-- Name: 43d753e46db9
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 and l_0_0.image_path then
  local l_0_1 = l_0_0.image_path:match("([^\\]+)$") or ""
  if string.lower(l_0_1) == "w3wp.exe" then
    local l_0_2 = mp.GetScannedPPID()
    if l_0_2 == "" or l_0_2 == nil then
      return mp.CLEAN
    end
    local l_0_3 = mp.GetProcessCommandLine(l_0_2)
    if l_0_3 then
      MpCommon.BmTriggerSig(l_0_0.ppid, "PFApp_IISSrvExploit_A", l_0_3)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
