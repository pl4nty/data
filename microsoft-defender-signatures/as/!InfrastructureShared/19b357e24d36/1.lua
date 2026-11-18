-- Threat: !InfrastructureShared
-- Name: 19b357e24d36
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_1.ppid, l_0_0)
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
