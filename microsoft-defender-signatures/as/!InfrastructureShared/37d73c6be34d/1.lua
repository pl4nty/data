-- Threat: !InfrastructureShared
-- Name: 37d73c6be34d
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 60 then
  return mp.CLEAN
end
if 450 < #l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
