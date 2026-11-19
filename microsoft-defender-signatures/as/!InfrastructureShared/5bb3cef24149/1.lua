-- Threat: !InfrastructureShared
-- Name: 5bb3cef24149
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
bm.request_SMS(l_0_0.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 100)
return mp.INFECTED
