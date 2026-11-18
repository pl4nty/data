-- Threat: !InfrastructureShared
-- Name: 5b7804000c98
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
