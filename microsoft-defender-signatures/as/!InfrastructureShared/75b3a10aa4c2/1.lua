-- Threat: !InfrastructureShared
-- Name: 75b3a10aa4c2
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if l_0_0 then
  if not string.find(l_0_0, "^c:\\") then
    return mp.CLEAN
  end
  if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\game", 1, true) then
    return mp.CLEAN
  end
end
local l_0_1 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_1.ppid, "M")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
