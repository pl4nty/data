-- Threat: !InfrastructureShared
-- Name: 75b3e347207b
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
if l_0_0 ~= nil then
  for l_0_2, l_0_3 in ipairs(l_0_0) do
    if l_0_3.image_path ~= nil and l_0_3.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_4 = string.lower(MpCommon.PathToWin32Path(l_0_3.image_path))
      if string.find(l_0_4, "\\comodo internet security\\cavwp.exe", -35, true) or string.find(l_0_4, "\\hummingheads\\securityplatform\\bkhost.exe", -41, true) then
        return mp.CLEAN
      end
    end
  end
end
if l_0_1 ~= nil then
  for l_0_5, l_0_6 in ipairs(l_0_1) do
    if l_0_6.image_path ~= nil and l_0_6.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_7 = string.lower(MpCommon.PathToWin32Path(l_0_6.image_path))
      if string.find(l_0_7, "\\acrord32.exe", -13, true) or string.find(l_0_7, "\\adobearm.exe", -13, true) or string.find(l_0_7, "\\comodo internet security\\cavwp.exe", -35, true) or string.find(l_0_7, "\\acrobat reader dc\\reader\\reader_sl.exe", -39, true) or string.find(l_0_7, "\\\\hummingheads\\securityplatform\\bkhost.exe", -41, true) or string.find(l_0_7, "\\rdrcef.exe", -11, true) then
        return mp.CLEAN
      end
      bm.request_SMS(l_0_6.ppid, "l+")
      bm.add_action("SmsAsyncScanEvent", 1)
      bm.trigger_sig("Arya", "Acrord32")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
