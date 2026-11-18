-- Threat: !InfrastructureShared
-- Name: 130b39de56230
-- Type: 21
-- Includes: LuaFuncHelper, AppomalyHelpers

if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 then
  local l_0_0 = this_sigattrlog[6].utf8p1
  l_0_0 = MpCommon.PathToWin32Path(l_0_0) or l_0_0
  if not l_0_0 then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  if mp.IsKnownFriendlyFile(l_0_0, true, false) then
    return mp.CLEAN
  end
  local l_0_1, l_0_2, l_0_3 = IsFileRecentlyDropped(l_0_0)
  if l_0_1 then
    bm.add_related_string("RecentDll", l_0_2 .. "|" .. (safeJsonDeserialize(l_0_3) or ""), bm.RelatedStringBMReport)
  end
end
return mp.CLEAN
