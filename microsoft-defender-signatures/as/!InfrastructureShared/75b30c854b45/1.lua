-- Threat: !InfrastructureShared
-- Name: 75b30c854b45
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if l_0_4.image_path ~= nil and l_0_4.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_5 = string.lower(MpCommon.PathToWin32Path(l_0_4.image_path))
      if string.find(l_0_5, "\\comodo internet security\\cavwp.exe", -35, true) or string.find(l_0_5, "\\hummingheads\\securityplatform\\bkhost.exe", -41, true) then
        return mp.CLEAN
      end
    end
  end
end
if l_0_2 ~= nil then
  for l_0_6, l_0_7 in ipairs(l_0_2) do
    if l_0_7.image_path ~= nil and l_0_7.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_8 = string.lower(MpCommon.PathToWin32Path(l_0_7.image_path))
      if string.find(l_0_8, "\\acrord32.exe", -13, true) or string.find(l_0_8, "\\adobearm.exe", -13, true) or string.find(l_0_8, "\\comodo internet security\\cavwp.exe", -35, true) or string.find(l_0_8, "\\acrobat reader dc\\reader\\reader_sl.exe", -39, true) or string.find(l_0_8, "\\hummingheads\\securityplatform\\bkhost.exe", -41, true) or string.find(l_0_8, "\\rdrcef.exe", -11, true) then
        return mp.CLEAN
      end
      local l_0_9 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_7.ppid)
      if l_0_9.IntegrityLevel > l_0_0.integrity_level then
        bm.request_SMS(l_0_7.ppid, "l+")
        bm.add_action("SmsAsyncScanEvent", 1)
        bm.trigger_sig("Arya", "Acrord32")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
