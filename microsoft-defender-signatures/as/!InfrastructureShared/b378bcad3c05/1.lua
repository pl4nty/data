-- Threat: !InfrastructureShared
-- Name: b378bcad3c05
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
