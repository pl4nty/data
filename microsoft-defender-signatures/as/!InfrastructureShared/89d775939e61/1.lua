-- Threat: !InfrastructureShared
-- Name: 89d775939e61
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if StringEndsWith(string.lower(l_0_1), ".dll,visibleentry") then
  return mp.INFECTED
end
return mp.CLEAN
