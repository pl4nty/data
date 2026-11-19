-- Threat: !InfrastructureShared
-- Name: 33d70b73980f
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
  return mp.INFECTED
end
return mp.CLEAN
