-- Threat: !InfrastructureShared
-- Name: 23eb3ddf40f9b
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil and this_sigattrlog[8].utf8p2 ~= "" then
  local l_0_0 = this_sigattrlog[8].utf8p2
  local l_0_1 = bm.get_imagepath()
  local l_0_2 = bm.get_current_process_startup_info()
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2.command_line
  if l_0_3 == nil or l_0_3 == "" then
    return mp.CLEAN
  end
  if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS(l_0_1) then
    return mp.CLEAN
  end
  if l_0_0:find("with hidden answer", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
