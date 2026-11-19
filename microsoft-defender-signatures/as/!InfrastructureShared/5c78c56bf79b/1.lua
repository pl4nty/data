-- Threat: !InfrastructureShared
-- Name: 5c78c56bf79b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
