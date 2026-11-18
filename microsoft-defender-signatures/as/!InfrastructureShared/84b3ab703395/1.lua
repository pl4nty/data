-- Threat: !InfrastructureShared
-- Name: 84b3ab703395
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.CLEAN
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[2].utf8p2, true)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = reportGenericRansomware(this_sigattrlog[3].utf8p2, true)
end
if l_0_0 == mp.INFECTED then
  local l_0_1 = bm.get_current_process_startup_info()
  if l_0_1.command_line then
    bm_AddRelatedFileFromCommandLine(l_0_1.command_line, nil, nil, 4)
  end
  return mp.INFECTED
end
return mp.CLEAN
