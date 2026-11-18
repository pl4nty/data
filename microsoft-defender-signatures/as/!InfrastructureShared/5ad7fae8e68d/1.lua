-- Threat: !InfrastructureShared
-- Name: 5ad7fae8e68d
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2
l_0_2 = string.match(l_0_1, "binpath=\"?([^\"%s]+%.sys)\"?")
if not l_0_2 then
  AppendToRollingQueue("NewServiceCreated", l_0_1, l_0_2, 500)
  return mp.CLEAN
end
return mp.INFECTED
