-- Threat: !InfrastructureShared
-- Name: 9ed7c2b3b719
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = "%s*([^%s]+://%d+%.%d+%.%d+%.%d+)/"
local l_0_3 = l_0_1:match(l_0_2)
if l_0_3 then
  TrackAttackerServer(l_0_3, 5000)
  return mp.INFECTED
end
return mp.CLEAN
