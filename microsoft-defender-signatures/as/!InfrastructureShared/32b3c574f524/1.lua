-- Threat: !InfrastructureShared
-- Name: 32b3c574f524
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if analyzeEsxcliProcessPattern(l_0_1) == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
