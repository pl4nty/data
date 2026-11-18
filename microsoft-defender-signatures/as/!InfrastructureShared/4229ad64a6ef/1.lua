-- Threat: !InfrastructureShared
-- Name: 4229ad64a6ef
-- Type: 21

if string.find(string.lower(mp.getfilename()), "%-%>%[cmdembedded%]$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
