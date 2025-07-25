-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPersistContextSetAtt\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or #l_0_0 <= 4 then
  return mp.CLEAN
end
checkPersistContextSetAttribute = function(l_1_0, l_1_1, l_1_2)
  -- function num : 0_0
  if l_1_1 == nil or l_1_2 == nil then
    return false
  end
  local l_1_3 = (MpCommon.QueryPersistContext)(l_1_0, l_1_1)
  if l_1_3 then
    (mp.set_mpattribute)(l_1_2)
    return true
  end
  return false
end

if (string.sub)(l_0_0, -4) == ".dll" then
  checkPersistContextSetAttribute(l_0_0, "PossibleDllHijackExecFlowRenameA", "Lua:PossibleDllHijackExecFlowRenameA")
  checkPersistContextSetAttribute(l_0_0, "PossibleDllHijackExecFlowRenameB", "Lua:PossibleDllHijackExecFlowRenameB")
  checkPersistContextSetAttribute(l_0_0, "PossibleDllHijackExecFlowA", "Lua:PossibleDllHijackExecFlowA")
  checkPersistContextSetAttribute(l_0_0, "PossibleDllHijackExecFlowA", "Lua:PossibleDllHijackExecFlowB")
end
return mp.CLEAN

