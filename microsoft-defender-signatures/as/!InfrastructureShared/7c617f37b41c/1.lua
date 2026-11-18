-- Threat: !InfrastructureShared
-- Name: 7c617f37b41c
-- Type: 21

if string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)) == "iexplore.exe" then
  return mp.INFECTED
end
return mp.CLEAN
