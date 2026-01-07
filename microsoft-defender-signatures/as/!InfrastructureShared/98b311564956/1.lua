-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\98b311564956\1.luac 

-- params : ...
-- function num : 0
do
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" then
    local l_0_0 = (this_sigattrlog[2]).utf8p2
    ExtendedSuspMacPathsToMonitor = function(l_1_0)
  -- function num : 0_0
  if l_1_0:find("^/Users/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Downloads/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Library/Application Support/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/[^/]+$", 1, false) or l_1_0:find("^/tmp/[^/]+$", 1, false) or l_1_0:find("^/private/tmp/[^/]+$", 1, false) then
    return true
  end
  return false
end

    if ExtendedSuspMacPathsToMonitor(l_0_0) then
      if (sysio.IsFileExists)(l_0_0) then
        (bm.add_threat_file)(l_0_0)
        ;
        (bm.trigger_sig)("BmTraverseTreeBlockMac", "Detected")
      end
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

