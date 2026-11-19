-- Threat: !InfrastructureShared
-- Name: d5d7c035e3e3
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if string.len(l_0_1) > 1000 then
  return mp.CLEAN
end
return mp.INFECTED
