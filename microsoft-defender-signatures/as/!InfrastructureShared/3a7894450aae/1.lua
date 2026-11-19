-- Threat: !InfrastructureShared
-- Name: 3a7894450aae
-- Type: 21

if peattributes.no_security == true and mp.getfilesize() < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
