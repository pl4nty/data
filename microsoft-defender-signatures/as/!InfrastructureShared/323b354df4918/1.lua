-- Threat: !InfrastructureShared
-- Name: 323b354df4918
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 100)
TrackPidAndTechniqueBM(l_0_0.ppid, "T1055.002", "processinjection_target")
return mp.INFECTED
