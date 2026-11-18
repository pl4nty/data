-- Threat: !InfrastructureShared
-- Name: a5b3b72a2d75
-- Type: 21

local l_0_0 = this_sigattrlog[8].utf8p1
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == nil or string.find(l_0_0, "c:\\", 1, true) == nil then
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
