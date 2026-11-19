-- Threat: !InfrastructureShared
-- Name: 117b35ae0763d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "svchost.exe -k camera -s frameserver", 1, true) then
  return mp.CLEAN
end
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 100)
TrackPidAndTechniqueBM(l_0_0.ppid, "T1055.002", "processinjection_source")
return mp.INFECTED
