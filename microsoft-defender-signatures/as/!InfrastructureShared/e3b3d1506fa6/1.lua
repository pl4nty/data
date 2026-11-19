-- Threat: !InfrastructureShared
-- Name: e3b3d1506fa6
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 5000)
bm.trigger_sig_delayed("ForceSmsExit", "H", 120000)
return mp.INFECTED
