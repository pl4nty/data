-- Threat: !InfrastructureShared
-- Name: 44d7cdca60bc
-- Type: 21
-- Includes: AppomalyHelpers

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0):lower()
if hasBase64Content(l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN
