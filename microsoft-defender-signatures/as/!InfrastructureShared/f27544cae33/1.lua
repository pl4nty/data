-- Threat: !InfrastructureShared
-- Name: f27544cae33
-- Type: 21

if string.find(string.lower(mp.getfilename()), "%-%>%(rarsfx%)%-%>%w+%.vbs$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
