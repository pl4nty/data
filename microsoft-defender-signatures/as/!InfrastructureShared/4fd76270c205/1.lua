-- Threat: !InfrastructureShared
-- Name: 4fd76270c205
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if 200 < #l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
