-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/ObfJsDownloaderDrop
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if MpCommon.QueryPersistContext(l_0_0, "isErik") then
    return mp.INFECTED
  end
  local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
  if #l_0_2 < 4 or 8 < #l_0_2 then
    return mp.CLEAN
  end
  local l_0_3 = "programdata\\{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}$"
  if not string.find(l_0_1, l_0_3) then
    return mp.CLEAN
  end
  local l_0_4 = {
    ["wscript.exe"] = true,
    ["cscript.exe"] = true
  }
  local l_0_5 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_5 and l_0_4[l_0_5] then
    return mp.INFECTED
  end
end
return mp.CLEAN
