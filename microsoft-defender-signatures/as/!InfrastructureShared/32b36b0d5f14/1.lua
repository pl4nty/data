-- Threat: !InfrastructureShared
-- Name: 32b36b0d5f14
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 1)
return mp.INFECTED
