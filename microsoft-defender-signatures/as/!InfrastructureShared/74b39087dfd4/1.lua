-- Threat: !InfrastructureShared
-- Name: 74b39087dfd4
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.ppid then
  bm.trigger_sig_target_propagate("SuspClickFixRundll32", "SuspClickFixRundll32", l_0_0.ppid)
  bm.request_SMS(l_0_0.ppid, "M")
  bm.add_action("SmsAsyncScanEvent", 3000)
end
return mp.INFECTED
