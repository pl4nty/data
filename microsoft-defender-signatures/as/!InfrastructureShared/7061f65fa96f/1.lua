-- Threat: !InfrastructureShared
-- Name: 7061f65fa96f
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
