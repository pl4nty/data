-- Threat: !InfrastructureShared
-- Name: 10eb3c98d460c
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.request_SMS(l_0_0.ppid, "H")
  bm.add_action("SmsAsyncScanEvent", 3000)
  bm.add_action("SmsAsyncScanEvent", 10000)
end
return mp.INFECTED
