-- Threat: !InfrastructureShared
-- Name: 25b37f9e0dee
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and (string.find(l_0_0, "windows\\system32\\svchost.exe", 1, true) or string.find(l_0_0, "windows\\system32\\dllhost.exe", 1, true) or string.find(l_0_0, "\\sechealthui.exe", 1, true) or string.find(l_0_0, "windows\\system32\\werfault.exe", 1, true)) then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_1.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
