-- Threat: !InfrastructureShared
-- Name: 22ab35f117c5a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil and this_sigattrlog[6].utf8p1 ~= "" then
  local l_0_3
  if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil and this_sigattrlog[7].utf8p1 ~= "" then
    l_0_3 = this_sigattrlog[7].utf8p1
  elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil and this_sigattrlog[8].utf8p1 ~= "" then
    l_0_3 = this_sigattrlog[8].utf8p1
  end
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  if string.find(l_0_3, this_sigattrlog[6].utf8p1, 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
