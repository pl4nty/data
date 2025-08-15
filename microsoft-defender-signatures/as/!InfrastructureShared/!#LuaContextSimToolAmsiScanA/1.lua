-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextSimToolAmsiScanA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil or #l_0_0 <= 3 then
  return mp.CLEAN
end
local l_0_1 = GetTacticsCountForPid(l_0_0)
if l_0_1 == nil or l_0_1 <= 0 then
  return mp.CLEAN
end
if IsTacticObservedForPid(l_0_0, "simtool_childproc") or IsTacticObservedForParents(l_0_0, "simtool_childproc", 3) then
  if (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
    (mp.set_mpattribute)("Lua:Context/SimToolPowerShellAMSIScan.A")
  end
  return mp.INFECTED
end
return mp.CLEAN

