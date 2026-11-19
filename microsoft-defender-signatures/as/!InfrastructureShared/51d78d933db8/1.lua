-- Threat: !InfrastructureShared
-- Name: 51d78d933db8
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil or #l_0_1 <= 32 then
  return mp.CLEAN
end
if StringEndsWith(l_0_1, "_c.dll,visibleentry") then
  return mp.INFECTED
end
return mp.CLEAN
