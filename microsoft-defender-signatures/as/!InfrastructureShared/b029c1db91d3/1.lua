-- Threat: !InfrastructureShared
-- Name: b029c1db91d3
-- Type: 21

if string.find(string.lower(mp.getfilename()), "%-%>%(rarsfx%)%-%>inst%.vbs$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
