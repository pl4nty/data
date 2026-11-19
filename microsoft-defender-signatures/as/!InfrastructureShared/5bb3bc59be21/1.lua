-- Threat: !InfrastructureShared
-- Name: 5bb3bc59be21
-- Type: 21
-- Includes: LuaFuncHelper

if GetRollingQueueCount("FireFalcon_Clash") > 0 then
  return mp.CLEAN
end
AppendToRollingQueue("FireFalcon_Clash", "1", 1, 604800)
return mp.INFECTED
