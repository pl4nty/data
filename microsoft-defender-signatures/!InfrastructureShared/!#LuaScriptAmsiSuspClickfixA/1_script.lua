-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaScriptAmsiSuspClickfixA\1_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
if IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0, true) then
  return mp.INFECTED
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_1.ppid, true) then
  return mp.INFECTED
end
return mp.CLEAN

