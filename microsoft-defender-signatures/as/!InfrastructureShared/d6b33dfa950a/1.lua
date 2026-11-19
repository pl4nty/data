-- Threat: !InfrastructureShared
-- Name: d6b33dfa950a
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 100)
return mp.INFECTED
