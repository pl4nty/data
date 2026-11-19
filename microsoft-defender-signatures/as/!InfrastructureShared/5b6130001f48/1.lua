-- Threat: !InfrastructureShared
-- Name: 5b6130001f48
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 300000 then
  return mp.INFECTED
end
return mp.CLEAN
