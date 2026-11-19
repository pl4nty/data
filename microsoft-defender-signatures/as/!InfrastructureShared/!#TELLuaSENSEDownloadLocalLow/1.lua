-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:SENSEDownloadLocalLow
-- Type: 10
-- MpAttributes: RPF:TopLevelFile

if mp.GetScanSource() == mp.SCANSOURCE_SENSE then
  local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_0:sub(-8) == "locallow" or l_0_0:sub(-9) == "downloads" then
    return mp.INFECTED
  end
end
return mp.CLEAN
