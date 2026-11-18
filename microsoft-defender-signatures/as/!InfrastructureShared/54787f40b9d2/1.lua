-- Threat: !InfrastructureShared
-- Name: 54787f40b9d2
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() > 107000 then
  return mp.INFECTED
end
return mp.CLEAN
