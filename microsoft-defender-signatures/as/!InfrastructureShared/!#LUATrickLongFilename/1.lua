-- Threat: !InfrastructureShared
-- Name: !#LUA:TrickLongFilename
-- Type: 8

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if string.sub(l_0_0, -20) == "________________.exe" then
    mp.set_mpattribute("LUA:TrickLongFilename")
  end
end
return mp.CLEAN
