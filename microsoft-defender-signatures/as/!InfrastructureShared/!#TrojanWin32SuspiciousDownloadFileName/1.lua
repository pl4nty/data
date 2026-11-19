-- Threat: !InfrastructureShared
-- Name: !#Trojan:Win32/SuspiciousDownloadFileName
-- Type: 10

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  local l_0_3 = mp.getfilesize()
  if 1000000 < l_0_3 then
    return mp.CLEAN
  end
  if l_0_2 == "exe[1].exe" and string.sub(l_0_1, -45, -22) == "temporary internet files" then
    mp.set_mpattribute("LUA:SuspiciousDownloadFileName")
  end
end
return mp.CLEAN
