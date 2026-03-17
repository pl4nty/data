-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextDataProcessName2\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_0 = (string.lower)(l_0_0)
  ;
  (mp.set_mpattribute)("Lua:OpenFileContextDataPresent")
  ;
  (mp.set_mpattribute)("Lua:OpenFileContextData:ProcName!" .. l_0_0)
  local l_0_1 = l_0_0:match("%.([^%.]+)$")
  if l_0_1 then
    (mp.set_mpattribute)("Lua:OpenFileContextData:ProcNameExt!" .. l_0_1)
  end
  if (mp.get_contextdata)(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
    (mp.set_mpattribute)("Lua:OpenFileForCreatingProcess")
  end
  local l_0_2, l_0_3 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_3 ~= nil then
    (mp.set_mpattribute)("Lua:OpenFileContextData:FileName!" .. l_0_3)
  end
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_4 ~= nil then
    local l_0_5 = (mp.GetParentProcInfo)(l_0_4)
    if l_0_5 ~= nil and l_0_5.image_path ~= nil then
      local l_0_6 = (string.lower)((string.match)(l_0_5.image_path, "([^\\]+)$"))
      if l_0_6 ~= nil then
        (mp.set_mpattribute)("Lua:OpenFileContextData:Parent!" .. l_0_6)
      end
    end
  end
end
do
  return mp.CLEAN
end

