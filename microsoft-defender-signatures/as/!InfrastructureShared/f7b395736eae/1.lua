-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f7b395736eae\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) or l_0_2:find("%s+/tmp/", 1, false) or l_0_2:find("%s+/private/tmp/", 1, false) or l_0_2:find("%s+/Users/Shared/", 1, false) or l_0_2:find("%s+/Users/.", 1, false) or l_0_2:find("%s+/Users/[^/]+/.", 1, false) or l_0_2:find("%s+/Users/[^/]+/Downloads/", 1, false) or l_0_2:find("%s+/Library/Caches/", 1, false) or l_0_2:find("%s+~/.", 1, false) then
  return mp.INFECTED
end
return mp.CLEAN

