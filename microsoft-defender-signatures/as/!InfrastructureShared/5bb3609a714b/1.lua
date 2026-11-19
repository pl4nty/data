-- Threat: !InfrastructureShared
-- Name: 5bb3609a714b
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[2].utf8p2
else
  return mp.CLEAN
end
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
if IsKeyValuePairInRollingQueue("MAC_BROWSERDOWNLOAD_PATH", "mac_browserdownload_path", l_0_3) then
  TrackPidAndTechniqueBM("BM", "T1564.014", "DefenseEvasion_PRI2_ExtendedAttributes_Browser")
  return mp.INFECTED
end
return mp.CLEAN
