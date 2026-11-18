-- Threat: !InfrastructureShared
-- Name: c5b3e786ffa7
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
bm.request_SMS(l_0_0.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
