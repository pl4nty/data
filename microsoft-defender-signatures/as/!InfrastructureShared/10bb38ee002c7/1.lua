-- Threat: !InfrastructureShared
-- Name: 10bb38ee002c7
-- Type: 21
-- Includes: BMLuaLib

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
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_3 = string.lower(this_sigattrlog[3].utf8p2)
end
if string.find(l_0_3, "http", 1, true) and string.find(l_0_3, ".pages.dev/", 1, true) and string.find(l_0_3, ".aspx -o ", 1, true) and string.find(l_0_3, "/library/application support/", 1, true) then
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  return mp.INFECTED
end
return mp.CLEAN
