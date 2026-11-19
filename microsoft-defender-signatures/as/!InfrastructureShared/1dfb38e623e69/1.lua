-- Threat: !InfrastructureShared
-- Name: 1dfb38e623e69
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3.image_path ~= nil and l_0_3.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_4 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
      if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) then
        bm.add_related_file(l_0_4)
        local l_0_5 = bm.get_current_process_startup_info()
        bm.request_SMS(l_0_5.ppid, "h+")
        bm.add_action("SmsAsyncScanEvent", 1)
      end
      local l_0_6 = string.lower(MpCommon.PathToWin32Path(l_0_3.image_path))
      if string.find(l_0_6, "\\installutil.exe", -16, true) then
        bm.request_SMS(l_0_3.ppid, "h+")
        bm.add_action("SmsAsyncScanEvent", 1)
        bm.trigger_sig("InstallUtil", "WriteVM")
        TrackPidAndTechniqueBM("BM", "T1055.002", "portable_executable_injection")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
