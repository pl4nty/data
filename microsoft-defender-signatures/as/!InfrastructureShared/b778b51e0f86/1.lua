-- Threat: !InfrastructureShared
-- Name: b778b51e0f86
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
