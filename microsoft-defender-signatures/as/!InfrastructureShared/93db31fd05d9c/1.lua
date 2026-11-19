-- Threat: !InfrastructureShared
-- Name: 93db31fd05d9c
-- Type: 21

local l_0_0 = bm.get_imagepath()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = versioning.GetMachineGuid()
if l_0_1 and l_0_1:lower() == "136df845-438e-4214-ba56-aa31d0a2e1f4" then
  return mp.CLEAN
end
l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_0))
if not sysio.IsFileExists(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = sysio.GetFileLastWriteTime(l_0_0)
if not sysio.GetLastResult().Success or l_0_2 == 0 then
  return mp.CLEAN
end
l_0_2 = l_0_2 / 10000000 - 11644473600
local l_0_3 = MpCommon.GetCurrentTimeT()
if l_0_2 >= l_0_3 then
  return mp.CLEAN
end
local l_0_4 = (l_0_3 - l_0_2) / 60
local l_0_6 = l_0_4 <= 20160
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = bm.get_current_process_startup_info()
bm.request_SMS(l_0_7.ppid, "H")
bm.add_action("SmsAsyncScanEvent", 1000)
return mp.INFECTED
