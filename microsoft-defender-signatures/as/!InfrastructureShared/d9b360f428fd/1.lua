-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d9b360f428fd\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil and (this_sigattrlog[5]).utf8p1 ~= "" then
  local l_0_0 = (bm.get_current_process_startup_info)()
  local l_0_1 = (bm.get_imagepath)()
  local l_0_2 = l_0_0.command_line
  if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) then
    return mp.CLEAN
  end
  ExtendedSuspMacPathsToMonitor = function(l_1_0)
  -- function num : 0_0
  if SuspMacPathsToMonitor(l_1_0, true) then
    return true
  end
  if l_1_0:find("^/Users/[^/]+/Desktop/", 1, false) or l_1_0:find("^/Users/[^/]+/Documents/", 1, false) or l_1_0:find("^/Users/[^/]+/Downloads/", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+$", 1, false) or l_1_0:find("^/Users/[^/]+/Library/[^/]+/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+$", 1, false) or l_1_0:find("^/Library/[^/]+/[^/]+$", 1, false) then
    return true
  end
  return false
end

  local l_0_3 = (this_sigattrlog[5]).utf8p1
  if ExtendedSuspMacPathsToMonitor(l_0_3) and (l_0_3:match("/%.[^/]+$") or l_0_3:match("^%.[^/]+$")) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

