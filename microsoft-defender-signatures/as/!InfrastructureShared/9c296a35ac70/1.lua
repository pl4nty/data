-- Threat: !InfrastructureShared
-- Name: 9c296a35ac70
-- Type: 21

if string.find(string.lower(mp.getfilename()), "%-%>%(zipsfx%)%-%>%w+%.bat$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
