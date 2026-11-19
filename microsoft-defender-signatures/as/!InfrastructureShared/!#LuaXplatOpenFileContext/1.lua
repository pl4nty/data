-- Threat: !InfrastructureShared
-- Name: !#Lua:XplatOpenFileContext
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_0 == nil then
    return mp.CLEAN
  end
  l_0_0 = string.lower(l_0_0)
  mp.set_mpattribute("Lua:XplatOpenFile:ProcName!" .. l_0_0)
  local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_2 ~= nil then
    mp.set_mpattribute("Lua:XplatOpenFile:FileName!" .. l_0_2)
  end
  local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
  if l_0_3 ~= nil then
    local l_0_4 = mp.GetParentProcInfo(l_0_3)
    if l_0_4 ~= nil and l_0_4.image_path ~= nil then
      local l_0_5 = string.lower(string.match(l_0_4.image_path, "([^/]+)$"))
      if l_0_5 ~= nil then
        mp.set_mpattribute("Lua:XplatOpenFile:Parent!" .. l_0_5)
      end
    end
  end
end
return mp.CLEAN
