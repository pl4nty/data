-- Threat: !InfrastructureShared
-- Name: 323b3d6c40f53
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[12].matched and this_sigattrlog[12].utf8p1 ~= nil and this_sigattrlog[12].utf8p1 ~= "" then
  local l_0_0 = bm.get_current_process_startup_info()
  local l_0_1 = bm.get_imagepath()
  local l_0_2 = l_0_0.command_line
  if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_1) then
    return mp.CLEAN
  end
  local l_0_3 = this_sigattrlog[12].utf8p1
  if SuspMacPathsToMonitor(l_0_3, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
