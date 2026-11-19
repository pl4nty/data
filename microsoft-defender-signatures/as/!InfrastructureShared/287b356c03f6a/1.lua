-- Threat: !InfrastructureShared
-- Name: 287b356c03f6a
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 100)
return mp.INFECTED
