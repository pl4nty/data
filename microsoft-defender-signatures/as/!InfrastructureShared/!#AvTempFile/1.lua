-- Threat: !InfrastructureShared
-- Name: !#AvTempFile
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = string.lower(l_0_1)
  if not l_0_0 or not l_0_1 then
    return mp.CLEAN
  end
  if l_0_1 == "clamscan.exe" and string.find(l_0_0, "clamav%-[%w]+%.[%w]+%.clamtmp") then
    return mp.INFECTED
  end
  if l_0_1 == "avp.exe" and string.find(l_0_0, "windows\\temp\\ioc[%w]+%.tmp") then
    return mp.INFECTED
  end
end
return mp.CLEAN
