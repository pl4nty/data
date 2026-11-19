-- Threat: !InfrastructureShared
-- Name: 847874de6dd4
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 151558 then
  return mp.INFECTED
end
return mp.CLEAN
