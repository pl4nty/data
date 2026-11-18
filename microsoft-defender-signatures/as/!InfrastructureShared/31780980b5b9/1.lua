-- Threat: !InfrastructureShared
-- Name: 31780980b5b9
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
