-- Threat: !InfrastructureShared
-- Name: 2b9b3581a937b
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil and this_sigattrlog[9].utf8p2 ~= "" then
  l_0_3 = string.lower(this_sigattrlog[9].utf8p2)
end
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if string.find(l_0_3, "http", 1, true) and string.find(l_0_3, ".aspx", 1, true) then
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  return mp.INFECTED
end
return mp.CLEAN
