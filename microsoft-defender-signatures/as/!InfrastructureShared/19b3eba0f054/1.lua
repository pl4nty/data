-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19b3eba0f054\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = this_sigattrlog[1]
if l_0_0 and l_0_0.matched and l_0_0.utf8p2 then
  local l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_0.utf8p2)
  if not l_0_1 then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  if (mp.IsKnownFriendlyFile)(l_0_1, true, false) then
    return mp.CLEAN
  end
  if (string.find)(l_0_1, "\\windows\\system32", 1, true) or (string.find)(l_0_1, "\\windows\\syswow64", 1, true) then
    return mp.CLEAN
  end
  local l_0_2, l_0_3, l_0_4 = IsFileRecentlyDropped(l_0_1)
  do
    do
      if l_0_2 and l_0_3 and l_0_4 then
        local l_0_5 = safeJsonDeserialize(l_0_4)
        if l_0_5 and l_0_5.UnsignedFile then
          (bm.add_related_file)(l_0_1)
          return mp.INFECTED
        end
      end
      do return mp.CLEAN end
      return mp.CLEAN
    end
  end
end

