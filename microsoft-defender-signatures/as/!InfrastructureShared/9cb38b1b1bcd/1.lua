-- Threat: !InfrastructureShared
-- Name: 9cb38b1b1bcd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = tonumber(this_sigattrlog[4].utf8p1)
if l_0_0 == nil or l_0_0 < 315392 then
  return mp.CLEAN
end
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_1 ~= nil then
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if l_0_4.image_path ~= nil then
      local l_0_5 = string.lower(MpCommon.PathToWin32Path(l_0_4.image_path))
      if string.find(l_0_5, "gravostyle", 1, true) or string.find(l_0_5, "typeedit", 1, true) or string.find(l_0_5, "lasertype", 1, true) then
        return mp.CLEAN
      end
      if sysio.IsFileExists(l_0_5) and not mp.IsKnownFriendlyFile(l_0_5, true, false) then
        bm.add_related_file(l_0_5)
      end
    end
  end
end
local l_0_6 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if sysio.IsFileExists(l_0_6) and not mp.IsKnownFriendlyFile(l_0_6, true, false) then
  bm.add_related_file(l_0_6)
end
return mp.INFECTED
