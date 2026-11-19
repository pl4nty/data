-- Threat: !InfrastructureShared
-- Name: 9cb37077acc1
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0, l_0_1, l_0_2
if not this_sigattrlog[2].matched or this_sigattrlog[2].utf8p1 == nil or this_sigattrlog[2].utf8p1 == "" then
  return mp.CLEAN
end
if not this_sigattrlog[3].matched or this_sigattrlog[3].utf8p2 == nil or this_sigattrlog[3].utf8p2 == "" then
  return mp.CLEAN
end
l_0_2 = this_sigattrlog[2].utf8p1
l_0_1 = this_sigattrlog[3].utf8p2
if not l_0_2:match("/%.[^/]+$") and not l_0_2:match("^%.[^/]+$") then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_1, "^/.*/")
local l_0_4 = string.match(l_0_2, "^/.*/")
if l_0_3 ~= l_0_4 then
  return mp.CLEAN
end
l_0_0 = bm.get_imagepath()
if IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
local l_0_5 = bm.get_current_process_startup_info()
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_6 = l_0_5.command_line
if IsExcludedByCmdlineMacOS(l_0_6) then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_0) then
  return mp.INFECTED
end
return mp.CLEAN
