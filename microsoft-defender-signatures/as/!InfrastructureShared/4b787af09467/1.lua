-- Threat: !InfrastructureShared
-- Name: 4b787af09467
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
