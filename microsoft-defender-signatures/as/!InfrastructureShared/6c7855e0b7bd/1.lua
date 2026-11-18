-- Threat: !InfrastructureShared
-- Name: 6c7855e0b7bd
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
