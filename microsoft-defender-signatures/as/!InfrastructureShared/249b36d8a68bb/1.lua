-- Threat: !InfrastructureShared
-- Name: 249b36d8a68bb
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
if l_0_1 ~= nil then
  TrackPidAndTechniqueBM(l_0_1.ppid, "T1560", "Collection", 7200)
  addRelatedProcess()
end
return mp.INFECTED
