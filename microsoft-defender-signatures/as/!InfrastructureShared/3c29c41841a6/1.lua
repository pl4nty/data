-- Threat: !InfrastructureShared
-- Name: 3c29c41841a6
-- Type: 21

if string.find(string.lower(mp.getfilename()), "%-%>%(rarsfx%)%-%>%w+%.bat$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
