-- Threat: !InfrastructureShared
-- Name: 4ab35fdcf76f
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
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil and this_sigattrlog[1].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[1].utf8p2
end
if l_0_3 ~= "" and l_0_3 ~= nil then
  bm.trigger_sig("QuarantineFlagRemoved_Executed", l_0_3)
end
return mp.INFECTED
