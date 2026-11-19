-- Threat: !InfrastructureShared
-- Name: 79d78faa44c2
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
if TrackCustomPersistContextNameByPPID("query", l_0_0.ppid, "CapfetoxContextTriggerA") == true then
  return mp.INFECTED
end
return mp.CLEAN
