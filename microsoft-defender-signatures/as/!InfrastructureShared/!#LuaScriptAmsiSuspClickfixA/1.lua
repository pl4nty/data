-- Threat: !InfrastructureShared
-- Name: !#Lua:Script/AmsiSuspClickfix.A
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: SLF:PowerShell/LummaStealer.B | SCRIPT:SuspClickfix.A | SCRIPT:SuspClickfix.B

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
if IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0, true) then
  return mp.INFECTED
end
local l_0_1 = mp.GetParentProcInfo(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_1.ppid, true) then
  return mp.INFECTED
end
return mp.CLEAN
