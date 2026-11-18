-- Threat: !InfrastructureShared
-- Name: 10661fcd71126
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
