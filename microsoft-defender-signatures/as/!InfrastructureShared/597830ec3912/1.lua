-- Threat: !InfrastructureShared
-- Name: 597830ec3912
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
