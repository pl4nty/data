-- Threat: !InfrastructureShared
-- Name: 2db324aa2cf5
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1003.003", "NtdsFromDiskShadow", 60)
else
  TrackPidAndTechniqueBM("BM", "T1003.003", "NtdsFromDiskShadow", 60)
end
return mp.INFECTED
