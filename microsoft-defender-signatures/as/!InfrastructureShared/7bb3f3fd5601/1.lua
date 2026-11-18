-- Threat: !InfrastructureShared
-- Name: 7bb3f3fd5601
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
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[2].utf8p2
else
  return mp.CLEAN
end
if l_0_3 ~= "" and l_0_3 ~= nil and string.find(l_0_3, "character id", 1, true) and string.find(l_0_3, "- (item ", 1, true) and string.find(l_0_3, " mod ", 1, true) and string.find(l_0_3, "count of", 1, true) and string.find(l_0_3, "exit ", 1, true) then
  bm.trigger_sig("BmTraverseTreeBlockMac", "Detected")
  return mp.INFECTED
end
return mp.CLEAN
