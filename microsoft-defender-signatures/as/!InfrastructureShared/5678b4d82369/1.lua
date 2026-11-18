-- Threat: !InfrastructureShared
-- Name: 5678b4d82369
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
