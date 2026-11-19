-- Threat: !InfrastructureShared
-- Name: f271d0a747d
-- Type: 21

if string.find(string.lower(mp.getfilename()), "%-%>%(rarsfx%)%-%>%w+%.bat$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
