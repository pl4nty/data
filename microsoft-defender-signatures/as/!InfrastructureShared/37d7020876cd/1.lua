-- Threat: !InfrastructureShared
-- Name: 37d7020876cd
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0.ppid, "T1087", "runs_joeware_adfind")
if IsDetectionThresholdMet(l_0_0.ppid) then
  return mp.INFECTED
end
return mp.CLEAN
