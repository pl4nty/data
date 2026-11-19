-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:PeProcreateFromADS
-- Type: 9
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1:find(":", 1, true) then
    if l_0_0:sub(1, 8) == "\\device\\" then
      l_0_0 = MpCommon.PathToWin32Path(l_0_0):lower()
    end
    if l_0_0:find("system32\\cngsvc.exe:") then
      return mp.CLEAN
    end
    local l_0_2 = l_0_0 .. "\\" .. l_0_1
    local l_0_3 = MpCommon.QueryPersistContext(l_0_2, "CreateProcFromAlternateDataStream")
    if not l_0_3 then
      MpCommon.AppendPersistContext(l_0_2, "CreateProcFromAlternateDataStream", 100)
    end
    mp.set_mpattribute("BM_PeFileInAlternateDataStream")
    return mp.INFECTED
  end
end
return mp.CLEAN
