-- Threat: !InfrastructureShared
-- Name: 84b3dd5af0c3
-- Type: 21

local l_0_0
local l_0_1 = bm.get_current_process_startup_info()
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1]
end
if l_0_0.utf8p1 == nil then
  return mp.CLEAN
end
local l_0_2 = sysio.GetFileSize(l_0_0.utf8p1)
if l_0_2 < 10485760 and l_0_1 ~= nil and l_0_1.ppid ~= nil then
  bm.request_SMS(l_0_1.ppid, "m")
  bm.add_action("SmsAsyncScanEvent", 1)
  return mp.INFECTED
end
return mp.CLEAN
