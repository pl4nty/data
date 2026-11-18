-- Threat: !InfrastructureShared
-- Name: 917831d1d980
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
