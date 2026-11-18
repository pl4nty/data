-- Threat: !InfrastructureShared
-- Name: 6f6165be3479
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
