-- Threat: !InfrastructureShared
-- Name: 19b31269750f
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 1)
return mp.INFECTED
