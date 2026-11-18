-- Threat: !InfrastructureShared
-- Name: 81b329a5fb98
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\program files", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_1.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 100)
return mp.INFECTED
