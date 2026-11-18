-- Threat: !InfrastructureShared
-- Name: 6f78aa512487
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
