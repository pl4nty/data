-- Threat: !InfrastructureShared
-- Name: 131b3751f876a
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
TrackCustomPersistContextNameByPPID("set", l_0_0.ppid, "MimikatzTrigger")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
