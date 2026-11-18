-- Threat: !InfrastructureShared
-- Name: 8978827b595b
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
