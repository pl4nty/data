-- Threat: !InfrastructureShared
-- Name: 5178001cca7b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
