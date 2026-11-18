-- Threat: !InfrastructureShared
-- Name: 4bd7a482da1d
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0.ppid, "T1016", "netconfig_discovery_adfind")
return mp.INFECTED
