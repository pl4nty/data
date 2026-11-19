-- Threat: !InfrastructureShared
-- Name: 43d7f5f3280a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if IsCommandLineTrackedForTechnique(l_0_1, "T1547.001") == true then
  return mp.INFECTED
end
return mp.CLEAN
