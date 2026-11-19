-- Threat: !InfrastructureShared
-- Name: 5b784e09d043
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
