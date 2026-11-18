-- Threat: !InfrastructureShared
-- Name: a7d7bee94779
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.GetProcessCommandLine(l_0_0))
if string.find(l_0_1, ":\"\\..\\", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
