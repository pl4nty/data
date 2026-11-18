-- Threat: !InfrastructureShared
-- Name: 5b783a11e7a5
-- Type: 21

if peattributes.no_security and mp.getfilesize() > 28000 and mp.getfilesize() < 37000 then
  return mp.INFECTED
end
return mp.CLEAN
