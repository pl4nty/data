-- Threat: !InfrastructureShared
-- Name: 43b33e49aa16
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.request_SMS(l_0_0.ppid, "l")
  bm.add_action("SmsAsyncScanEvent", 100)
end
return mp.INFECTED
