-- Threat: !InfrastructureShared
-- Name: 83783d633f22
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
