-- Threat: !InfrastructureShared
-- Name: 5261c29ad7f6
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
