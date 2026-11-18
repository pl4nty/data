-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:ContextualDropPossibleRansomExe.A!fdr
-- Type: 9
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  if not peattributes.isexe or peattributes.isdriver or peattributes.no_security == false or peattributes.no_fixups == false then
    return mp.CLEAN
  end
  local l_0_0 = mp.getfilesize()
  if l_0_0 < 262144 or 1048576 < l_0_0 then
    return mp.CLEAN
  end
  local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_FNAME), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1:find("\\temp\\", 1, true) == nil then
    return mp.CLEAN
  end
  local l_0_3 = {
    ["exename.exe"] = true
  }
  if l_0_3[l_0_2] then
    return mp.INFECTED
  end
  if l_0_2:find("^rad%x%x%x%x%x%.tmp%.exe$") then
    return mp.INFECTED
  end
end
return mp.CLEAN
