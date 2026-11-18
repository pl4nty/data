-- Threat: !InfrastructureShared
-- Name: 5540d5249773
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
