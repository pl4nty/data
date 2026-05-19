-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaRenPyProcessContextA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 and #l_0_0 < 3 then
  return mp.CLEAN
end
if isKnownCleanPathContext(l_0_0) == true then
  return mp.CLEAN
end
local l_0_1 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_1 == nil or #l_0_1 <= 3 then
  return mp.CLEAN
end
if IsTacticObservedForPid(l_0_1, "masqueraded_renpy_process") then
  return mp.INFECTED
end
if IsTacticObservedForParents(l_0_1, "masqueraded_renpy_process", 4) then
  (mp.set_mpattribute)("Lua:RenPyProcessTreeContext.A")
end
return mp.CLEAN

