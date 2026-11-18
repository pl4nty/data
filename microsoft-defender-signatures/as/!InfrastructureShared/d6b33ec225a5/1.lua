-- Threat: !InfrastructureShared
-- Name: d6b33ec225a5
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and string.find(l_0_0.image_path, "/usr/sbin/cron", 1, true) then
  TrackPidAndTechniqueBM("BM", "T1053.003", "Execution_SuspiciousCronActivity")
  addRelatedProcess()
  return mp.INFECTED
end
return mp.CLEAN
