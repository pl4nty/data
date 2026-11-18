-- Threat: !InfrastructureShared
-- Name: 45b374a5a902
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.request_SMS(l_0_0.ppid, "m")
  bm.add_action("SmsAsyncScanEvent", 1)
end
return mp.INFECTED
