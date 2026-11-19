-- Threat: !InfrastructureShared
-- Name: 33784f51e01c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
