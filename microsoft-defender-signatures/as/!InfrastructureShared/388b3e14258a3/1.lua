-- Threat: !InfrastructureShared
-- Name: 388b3e14258a3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = bm.get_SMS_level(l_0_0.ppid)
local l_0_2 = mp.SMS_SCAN_LOW_ADV - mp.SMS_SCAN_LOW
if l_0_2 == mp.bitand(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = bm.get_imagepath()
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = string.lower(MpCommon.PathToWin32Path(l_0_3))
if not sysio.IsFileExists(l_0_3) then
  return mp.CLEAN
end
local l_0_4 = sysio.GetFileLastWriteTime(l_0_3)
if not sysio.GetLastResult().Success or l_0_4 == 0 then
  return mp.CLEAN
end
l_0_4 = l_0_4 / 10000000 - 11644473600
local l_0_5 = MpCommon.GetCurrentTimeT()
if l_0_4 >= l_0_5 then
  return mp.CLEAN
end
local l_0_6 = (l_0_5 - l_0_4) / 60
local l_0_8 = l_0_6 <= 20160
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9, l_0_10 = bm.get_process_relationships()
if l_0_10 ~= nil then
  for l_0_11, l_0_12 in ipairs(l_0_10) do
    if l_0_12.image_path ~= nil and l_0_12.reason == bm.RELATIONSHIP_INJECTION then
      bm.request_SMS(l_0_12.ppid, "l+")
      bm.add_action("SmsAsyncScanEvent", 1000)
      TrackPidAndTechniqueBM("BM", "T1055.002", "portable_executable_injection")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
