-- Threat: !InfrastructureShared
-- Name: !#ALF:LuaSuspLongHexFileName
-- Type: 10
-- MpAttributes: pea_isexe & RPF:TopLevelFile & (!Lua:EXEExt) & (!Lua:DLLExt) & (!Lua:SYSExt)

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 ~= nil and l_0_0:len() > 10 and l_0_1 ~= nil and l_0_1:len() > 31 then
    if l_0_0:find("\\backups\\", 1, true) or l_0_0:find("\\sharedcache\\resfiles\\", 1, true) or l_0_0:find("\\.git\\", 1, true) then
      return mp.CLEAN
    end
    local l_0_2 = string.sub(l_0_1, -5)
    if not l_0_2:find(".", 1, true) then
      return mp.CLEAN
    end
    local l_0_3 = l_0_1:match("[0-9a-f]+%.")
    local l_0_4 = l_0_3:len()
    if l_0_3 == nil or l_0_4 < 31 or string.find(l_0_3, "[0-9]", 1) == nil or string.find(l_0_3, "[a-f]", 1) == nil then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
