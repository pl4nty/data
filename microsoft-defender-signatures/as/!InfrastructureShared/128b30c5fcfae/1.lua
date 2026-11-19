-- Threat: !InfrastructureShared
-- Name: 128b30c5fcfae
-- Type: 21

local l_0_0
local l_0_1, l_0_2 = bm.get_process_relationships()
local l_0_3 = bm.get_current_process_startup_info()
if l_0_1 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_1) do
    if l_0_5.image_path ~= nil then
      l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_5.image_path))
      if string.find(l_0_0, "\\svchost.exe", -12, true) or string.find(l_0_0, "\\rastools.exe", -13, true) or string.find(l_0_0, "\\rastoolsservice.exe", -20, true) then
        return mp.CLEAN
      end
    end
  end
end
if l_0_0 == nil then
  return mp.CLEAN
end
if sysio.IsFileExists(l_0_0) and not mp.IsKnownFriendlyFile(l_0_0, true, false) then
  bm.request_SMS(l_0_3.ppid, "h+")
  bm.add_action("SmsAsyncScanEvent", 1000)
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
