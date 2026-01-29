-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\130b39de56230\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p2 then
  local l_0_0 = (this_sigattrlog[6]).utf8p1
  if (MpCommon.PathToWin32Path)(l_0_0) or not l_0_0 then
    return mp.CLEAN
  end
  l_0_0 = (string.lower)(l_0_0)
  if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
    return mp.CLEAN
  end
  local l_0_1, l_0_2, l_0_3 = IsFileRecentlyDropped(l_0_0)
  if not safeJsonDeserialize(l_0_3) then
    do
      (bm.add_related_string)("RecentDll", l_0_2 .. "|" .. (not l_0_1 or ""), bm.RelatedStringBMReport)
      return mp.CLEAN
    end
  end
end

