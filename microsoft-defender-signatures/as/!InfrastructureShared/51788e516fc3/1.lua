-- Threat: !InfrastructureShared
-- Name: 51788e516fc3
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
