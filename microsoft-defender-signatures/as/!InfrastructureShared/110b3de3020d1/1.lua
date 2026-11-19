-- Threat: !InfrastructureShared
-- Name: 110b3de3020d1
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.ppid then
  bm.request_SMS(l_0_0.ppid, "M")
  bm.add_action("SmsAsyncScanEvent", 1000)
end
return mp.INFECTED
