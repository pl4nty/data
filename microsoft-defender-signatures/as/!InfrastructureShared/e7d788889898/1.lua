-- Threat: !InfrastructureShared
-- Name: e7d788889898
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if type(l_0_1) ~= "string" then
  return mp.CLEAN
end
if ClassifyClickFixExecution(l_0_1, true) ~= "lowfi" then
  return mp.CLEAN
end
return mp.INFECTED
