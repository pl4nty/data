-- Threat: !InfrastructureShared
-- Name: 74d7ca665263
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
l_0_1 = string.lower(l_0_1)
if StringEndsWith(l_0_1, "syswow64\\explorer.exe") then
  return mp.INFECTED
end
return mp.CLEAN
