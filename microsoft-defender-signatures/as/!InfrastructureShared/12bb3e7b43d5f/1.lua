-- Threat: !InfrastructureShared
-- Name: 12bb3e7b43d5f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = 0
local l_0_1 = bm.get_current_process_startup_info()
local l_0_2 = mp.GetParentProcInfo(l_0_1.ppid)
if l_0_2 ~= nil then
  l_0_0 = GetTechniquesCountForPid(l_0_2.ppid)
  if 4 < l_0_0 then
    TrackPidAndTechniqueBM(l_0_2.ppid, "T1018", "Discovery_RemoteSystemDiscovery")
    addRelatedProcess()
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
