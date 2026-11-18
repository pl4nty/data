-- Threat: !InfrastructureShared
-- Name: 5dd7023ccaab
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0.ppid, "T1053.005", "wmic_jobcreate")
if IsDetectionThresholdMet(l_0_0.ppid) then
  return mp.INFECTED
end
return mp.LOWFI
