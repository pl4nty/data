-- Threat: !InfrastructureShared
-- Name: 12378e5c90559
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
