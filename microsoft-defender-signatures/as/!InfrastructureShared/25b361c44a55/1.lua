-- Threat: !InfrastructureShared
-- Name: 25b361c44a55
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 3000)
return mp.INFECTED
