-- Threat: !InfrastructureShared
-- Name: efb3b1e47f44
-- Type: 21

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p1
end
if l_0_0 == nil then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_0) then
  bm.add_related_file(l_0_0)
end
local l_0_1 = bm.get_current_process_startup_info()
if l_0_1 ~= nil and l_0_1.ppid ~= nil then
  bm.request_SMS(l_0_1.ppid, "m")
  bm.add_action("SmsAsyncScanEvent", 1)
end
return mp.INFECTED
