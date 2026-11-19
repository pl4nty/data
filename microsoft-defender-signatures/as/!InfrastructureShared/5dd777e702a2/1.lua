-- Threat: !InfrastructureShared
-- Name: 5dd777e702a2
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil or l_0_0.image_path == nil then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0.ppid, "T1482", "domaintrust_discovery_adfind")
return mp.INFECTED
