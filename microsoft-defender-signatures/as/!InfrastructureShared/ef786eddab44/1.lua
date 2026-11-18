-- Threat: !InfrastructureShared
-- Name: ef786eddab44
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 9900000 then
  return mp.INFECTED
end
return mp.CLEAN
