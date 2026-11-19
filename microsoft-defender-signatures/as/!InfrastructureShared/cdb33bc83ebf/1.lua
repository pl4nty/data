-- Threat: !InfrastructureShared
-- Name: cdb33bc83ebf
-- Type: 21

local l_0_0 = ""
if this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p1)
elseif this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[10].utf8p1)
else
  return mp.CLEAN
end
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
