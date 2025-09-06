-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextSimToolFileOperationA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_0 == nil or #l_0_0 <= 3 then
  return mp.CLEAN
end
local l_0_1 = GetTacticsCountForPid(l_0_0)
if l_0_1 == nil or l_0_1 <= 0 then
  return mp.CLEAN
end
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT)
local l_0_3 = false
-- DECOMPILER ERROR at PC47: Unhandled construct in 'MakeBoolean' P1

if (IsTacticObservedForPid(l_0_0, "simtool_childproc") or IsTacticObservedForParents(l_0_0, "simtool_childproc", 3)) and l_0_2 == true then
  (mp.set_mpattribute)("Lua:Context/SimToolCreatedFile.A")
end
l_0_3 = true
if IsBasToolProcessForPpid(l_0_0) then
  if l_0_2 == true then
    (mp.set_mpattribute)("Lua:Context/BasToolProcCreatedFile.A")
  end
  ;
  (mp.set_mpattribute)("Lua:ContextDataProcess/BasToolProcess.A")
  l_0_3 = true
  if IsBasToolProcessForPpid(l_0_0, "SafeBreach") then
    if l_0_2 == true then
      (mp.set_mpattribute)("Lua:Context/SafeBreachProcCreatedFile.A")
    end
    ;
    (mp.set_mpattribute)("Lua:ContextDataProcess/SafeBreachProcess.A")
  end
  if IsBasToolProcessForPpid(l_0_0, "AttackIQ") then
    if l_0_2 == true then
      (mp.set_mpattribute)("Lua:Context/AttackIQProcCreatedFile.A")
    end
    ;
    (mp.set_mpattribute)("Lua:ContextDataProcess/AttackIQProcess.A")
  end
end
if l_0_3 == true then
  return mp.INFECTED
end
return mp.CLEAN

