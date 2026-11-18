-- Threat: !InfrastructureShared
-- Name: 4d7870b78b3d
-- Type: 21

if peattributes.no_security and mp.getfilesize() < 7500000 then
  return mp.INFECTED
end
return mp.CLEAN
