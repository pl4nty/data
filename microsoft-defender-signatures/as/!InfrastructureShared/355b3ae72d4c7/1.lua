-- Threat: !InfrastructureShared
-- Name: 355b3ae72d4c7
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 5000)
return mp.INFECTED
