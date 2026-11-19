-- Threat: !InfrastructureShared
-- Name: 88293cf26e7a
-- Type: 21

if string.find(mp.getfilename(), "%-%>%(RarSfx%)%-%>CMT$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
