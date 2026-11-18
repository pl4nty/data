-- Threat: !InfrastructureShared
-- Name: 8a7897a00d67
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
