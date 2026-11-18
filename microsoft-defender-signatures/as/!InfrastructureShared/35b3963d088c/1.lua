-- Threat: !InfrastructureShared
-- Name: 35b3963d088c
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not string.find(l_0_0, "^c:\\") and not string.find(l_0_0, "^\\\\") then
  return mp.CLEAN
end
local l_0_1 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_1.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
