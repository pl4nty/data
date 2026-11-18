-- Threat: !InfrastructureShared
-- Name: 5d783662f119
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
