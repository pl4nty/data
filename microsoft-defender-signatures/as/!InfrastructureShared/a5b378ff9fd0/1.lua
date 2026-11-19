-- Threat: !InfrastructureShared
-- Name: a5b378ff9fd0
-- Type: 21

local l_0_0 = this_sigattrlog[1].utf8p2
if l_0_0 == nil or string.find(string.lower(l_0_0), "/reporting", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_1 = this_sigattrlog[7].utf8p1 or this_sigattrlog[8].utf8p1
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if l_0_1 == nil or string.find(l_0_1, "c:\\", 1, true) == nil then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_1) then
  bm.add_related_file(l_0_1)
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 ~= nil and l_0_2.ppid ~= nil then
  bm.request_SMS(l_0_2.ppid, "m")
  bm.add_action("SmsAsyncScanEvent", 1)
end
return mp.INFECTED
