-- Threat: !InfrastructureShared
-- Name: adb3c63b8aad
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = versioning.GetOrgID()
if l_0_3 == nil or l_0_3 == "" or l_0_3:lower() ~= "2d1d3ad2-ead9-4243-95a6-8897fcc65ea7" then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_UNS_ADHOC_PATHS", "unsigned_adhoc_items", l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
