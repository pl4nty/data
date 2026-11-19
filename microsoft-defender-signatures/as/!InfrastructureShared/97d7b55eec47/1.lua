-- Threat: !InfrastructureShared
-- Name: 97d7b55eec47
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  if l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    return mp.INFECTED
  end
  local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
  if l_0_1 ~= nil and l_0_1.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_1.ppid, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
