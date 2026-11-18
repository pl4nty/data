-- Threat: !InfrastructureShared
-- Name: 85400d4e1452
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
