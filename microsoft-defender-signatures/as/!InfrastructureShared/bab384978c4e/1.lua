-- Threat: !InfrastructureShared
-- Name: bab384978c4e
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if string.find(l_0_0, "\\werfault.exe", 1, true) then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_1.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 100)
return mp.INFECTED
