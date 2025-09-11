-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\98b311564956\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0 = (this_sigattrlog[2]).utf8p2
    ExtendedSuspMacPathsToMonitor = function(l_1_0)
  -- function num : 0_0
  if SuspMacPathsToMonitor(l_1_0, true) then
    return true
  end
  if l_1_0:find("^/Users/[^/]+/Desktop/", 1, false) or l_1_0:find("^/Users/[^/]+/Documents/", 1, false) or l_1_0:find("^/Users/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Downloads/", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+/[^/]+$", 1, false) then
    return true
  end
  return false
end

    if ExtendedSuspMacPathsToMonitor(l_0_0) then
      (bm.add_related_file)(l_0_0)
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

