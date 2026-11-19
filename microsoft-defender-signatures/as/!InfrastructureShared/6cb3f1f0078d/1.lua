-- Threat: !InfrastructureShared
-- Name: 6cb3f1f0078d
-- Type: 21

local l_0_0, l_0_1
local l_0_2, l_0_3 = bm.get_process_relationships()
if l_0_3 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    if l_0_5.image_path ~= nil and l_0_5.reason == bm.RELATIONSHIP_INJECTION then
      local l_0_6 = string.lower(MpCommon.PathToWin32Path(l_0_5.image_path))
      if not string.find(l_0_6, "\\system32\\svchost.exe", -21, true) or not string.find(l_0_6, "\\syswow64\\svchost.exe", -21, true) then
        return mp.CLEAN
      end
      l_0_0 = l_0_5.ppid
    end
  end
end
if l_0_2 ~= nil then
  for l_0_7, l_0_8 in ipairs(l_0_2) do
    if l_0_8.image_path ~= nil then
      l_0_1 = string.lower(MpCommon.PathToWin32Path(l_0_8.image_path))
      if sysio.IsFileExists(l_0_1) and not mp.IsKnownFriendlyFile(l_0_1, true, false) then
        bm.add_related_file(l_0_1)
      end
    end
  end
end
if l_0_0 ~= nil and l_0_1 ~= nil then
  bm.request_SMS(l_0_0, "l+")
  bm.add_action("SmsAsyncScanEvent", 1000)
  bm.trigger_sig("Cheddar", "ShellcodeSvchost")
  return mp.INFECTED
end
return mp.CLEAN
