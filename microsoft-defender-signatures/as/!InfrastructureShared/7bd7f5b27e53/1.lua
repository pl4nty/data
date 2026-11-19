-- Threat: !InfrastructureShared
-- Name: 7bd7f5b27e53
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 or #l_0_1 <= 120 or 4096 < #l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
