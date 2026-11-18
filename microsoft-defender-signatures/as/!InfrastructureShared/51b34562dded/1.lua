-- Threat: !InfrastructureShared
-- Name: 51b34562dded
-- Type: 21

if bm.GetSignatureMatchDuration() > 300000000 then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_0.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
