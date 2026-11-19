-- Threat: !InfrastructureShared
-- Name: 19dab3c0c12a1d
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 100)
return mp.INFECTED
