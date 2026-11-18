-- Threat: !InfrastructureShared
-- Name: 273b3107b428f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2
local l_0_3 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if this_sigattrlog[4].matched then
  l_0_2 = this_sigattrlog[4].utf8p2
end
if not contains(l_0_2, "^werfault.exe$", false) then
  return mp.CLEAN
end
local l_0_4, l_0_5 = bm.get_process_relationships()
if l_0_5 ~= nil then
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    if l_0_7.image_path ~= nil and (l_0_7.reason == bm.RELATIONSHIP_INJECTION or l_0_7.reason == bm.RELATIONSHIP_CREATED) then
      local l_0_8 = string.lower(l_0_7.image_path)
      if string.find(l_0_8, "\\werfault.exe", -13, true) then
        l_0_1 = l_0_7.ppid
      end
    end
  end
end
if l_0_4 ~= nil then
  for l_0_9, l_0_10 in ipairs(l_0_4) do
    if l_0_10.image_path ~= nil then
      l_0_0 = string.lower(MpCommon.PathToWin32Path(l_0_10.image_path))
    end
    if sysio.IsFileExists(l_0_0) and not mp.IsKnownFriendlyFile(l_0_0, true, false) then
      bm.add_related_file(l_0_0)
    end
  end
end
if sysio.IsFileExists(l_0_3) and not mp.IsKnownFriendlyFile(l_0_3, true, false) and l_0_1 ~= nil then
  bm.request_SMS(l_0_1, "M")
  bm.add_action("SmsAsyncScanEvent", 1)
  bm.add_related_file(l_0_3)
  return mp.INFECTED
end
return mp.CLEAN
