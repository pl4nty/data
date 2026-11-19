-- Threat: !InfrastructureShared
-- Name: 16bb3e8e2c3dd
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 then
  local l_0_0 = this_sigattrlog[6].utf8p1
  l_0_0 = MpCommon.PathToWin32Path(l_0_0) or l_0_0
  if not l_0_0 then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = l_0_0:match("^(.*)\\")
  local l_0_2 = bm.get_imagepath()
  if not l_0_2 then
    return mp.CLEAN
  end
  l_0_2 = MpCommon.PathToWin32Path(l_0_2) or l_0_2
  l_0_2 = string.lower(l_0_2)
  local l_0_3 = l_0_2:match("^(.*)\\")
  if l_0_3 ~= l_0_1 then
    return mp.CLEAN
  end
  if mp.IsKnownFriendlyFile(l_0_0, true, false) then
    return mp.CLEAN
  end
  local l_0_4 = sysio.GetPEVersionInfo(l_0_2) or {}
  if l_0_4.OriginalFilename and contains(l_0_4.OriginalFilename, {
    "U3BoostSvr",
    "AgentInstall",
    "USHSVC"
  }) or l_0_4.LegalCopyright and contains(l_0_4.LegalCopyright, "asus") then
    local l_0_5 = (l_0_4.OriginalFilename or "") .. "|" .. (l_0_4.CompanyName or "") .. "|" .. (l_0_4.LegalCopyright or "")
    bm.add_related_string("version_info", l_0_5, bm.RelatedStringBMReport)
    bm.add_related_string("BinaryPaths", l_0_2 .. "|" .. l_0_0, bm.RelatedStringBMReport)
    bm.add_related_file(l_0_2)
    bm.add_related_file(l_0_0)
    local l_0_6, l_0_7, l_0_8 = IsFileRecentlyDropped(l_0_0)
    if l_0_6 then
      bm.add_related_string("RecentDrop", l_0_7 .. "|" .. (safeJsonDeserialize(l_0_8) or ""), bm.RelatedStringBMReport)
    end
    local l_0_9 = sysio.GetPEVersionInfo(l_0_0) or {}
    bm.add_related_string("version_info_dll", l_0_9, bm.RelatedStringBMReport)
    return mp.INFECTED
  end
end
return mp.CLEAN
