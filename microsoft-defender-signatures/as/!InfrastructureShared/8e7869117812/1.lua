-- Threat: !InfrastructureShared
-- Name: 8e7869117812
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
