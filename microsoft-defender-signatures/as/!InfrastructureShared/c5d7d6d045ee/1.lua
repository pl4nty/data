-- Threat: !InfrastructureShared
-- Name: c5d7d6d045ee
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  TrackPidAndTechnique(l_0_0.ppid, "T1491.001", "Impact_Defacement_InternalDefacement_Wallpaper")
end
return mp.INFECTED
