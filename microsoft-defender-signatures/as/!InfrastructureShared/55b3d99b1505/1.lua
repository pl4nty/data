-- Threat: !InfrastructureShared
-- Name: 55b3d99b1505
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  bm.request_SMS(l_0_0.ppid, "M")
  bm.add_action("SmsAsyncScanEvent", 3000)
  return mp.INFECTED
end
return mp.CLEAN
