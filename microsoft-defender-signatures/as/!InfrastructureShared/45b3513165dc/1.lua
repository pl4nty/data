-- Threat: !InfrastructureShared
-- Name: 45b3513165dc
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if l_0_3.image_path ~= nil and l_0_3.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_4 = string.lower(MpCommon.PathToWin32Path(l_0_3.image_path))
      if string.find(l_0_4, "\\explorer.exe", -13, true) then
        local l_0_5 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
        local l_0_6 = bm.get_current_process_startup_info()
        if sysio.IsFileExists(l_0_5) and not mp.IsKnownFriendlyFile(l_0_5, true, false) then
          bm.add_related_file(l_0_5)
          bm.request_SMS(l_0_6.ppid, "m+")
          bm.add_action("SmsAsyncScanEvent", 1)
        end
        bm.request_SMS(l_0_3.ppid, "m+")
        bm.add_action("SmsAsyncScanEvent", 1)
        bm.trigger_sig("Explorer", "InjectRemoteThread")
        TrackPidAndTechniqueBM("BM", "T1055.002", "portable_executable_injection")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
