-- Threat: !InfrastructureShared
-- Name: !#Lua:Win32/DroppedViaRunMruChain
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & MpOnCloseNewlyCreatedHintRtpScan & (Lua:MSIExt | Lua:PS1Ext | Lua:PYExt) & (Lua:FileInsideAppDataFolder | Lua:FileInsideProgramDataFolder | Lua:FileInsideUserPublicFolder)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
if IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0, true) then
  return mp.INFECTED
else
  local l_0_1 = mp.GetParentProcInfo(l_0_0)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if l_0_1.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_1.ppid, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
