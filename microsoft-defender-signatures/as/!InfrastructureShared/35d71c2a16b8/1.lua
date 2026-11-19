-- Threat: !InfrastructureShared
-- Name: 35d71c2a16b8
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= "" then
  TrackPidAndTechnique(l_0_0.ppid, "T1083", "Discovery_FileAndDirectoryDiscovery_virsh")
end
return mp.INFECTED
