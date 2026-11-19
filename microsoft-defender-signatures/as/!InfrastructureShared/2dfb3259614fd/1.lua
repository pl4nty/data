-- Threat: !InfrastructureShared
-- Name: 2dfb3259614fd
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 5000)
TrackPidAndTechniqueBM(l_0_0.ppid, "T1055.002", "processinjection_source")
return mp.INFECTED
