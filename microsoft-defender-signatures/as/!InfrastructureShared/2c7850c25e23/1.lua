-- Threat: !InfrastructureShared
-- Name: 2c7850c25e23
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
