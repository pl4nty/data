-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/ObfJsDownloaderDropStart
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 and MpCommon.QueryPersistContext(l_0_0, "isErik") then
    return mp.INFECTED
  end
end
return mp.CLEAN
