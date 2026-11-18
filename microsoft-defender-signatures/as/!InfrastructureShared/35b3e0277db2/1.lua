-- Threat: !InfrastructureShared
-- Name: 35b3e0277db2
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.request_SMS(l_0_0.ppid, "m")
  bm.add_action("SmsAsyncScanEvent", 1000)
end
return mp.INFECTED
