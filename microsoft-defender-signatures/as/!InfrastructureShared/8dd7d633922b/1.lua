-- Threat: !InfrastructureShared
-- Name: 8dd7d633922b
-- Type: 21
-- Includes: AppomalyHelpers

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = mp.GetScannedPPID()
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = mp.GetProcessCommandLine(l_0_1):lower()
  if hasBase64Content(l_0_2) then
    return mp.INFECTED
  end
end
return mp.CLEAN
