-- Threat: !InfrastructureShared
-- Name: 8729e4510c1d
-- Type: 21

if string.find(mp.getfilename(), "%-%>%(RarSfx%)%-%>CMT$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
