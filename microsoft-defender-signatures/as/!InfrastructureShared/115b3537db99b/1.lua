-- Threat: !InfrastructureShared
-- Name: 115b3537db99b
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1
if not this_sigattrlog[5].matched or this_sigattrlog[5].utf8p2 == nil or this_sigattrlog[5].utf8p2 == "" then
  return mp.CLEAN
end
l_0_0 = bm.get_imagepath()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
if string.find(l_0_0, "Goblin.app/Contents/", 1, true) or string.find(l_0_0, "/download-package/clickhouse", 1, true) then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2.command_line
if IsExcludedByCmdlineMacOS(l_0_3) then
  return mp.CLEAN
end
l_0_1 = this_sigattrlog[5].utf8p2
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) and (string.find(l_0_1, "^/Users/[^/]+/Desktop/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Documents/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Downloads/[^/]+$", 1, false) or string.find(l_0_1, "^/private/tmp/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Desktop/[^/]+/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Documents/[^/]+/[^/]+$", 1, false) or string.find(l_0_1, "^/Users/[^/]+/Downloads/[^/]+/[^/]+$", 1, false) or string.find(l_0_1, "^/private/tmp/[^/]+/[^/]+$", 1, false)) then
  bm.trigger_sig("BM_UnsignedProcCreatedUnsignedFile", l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
