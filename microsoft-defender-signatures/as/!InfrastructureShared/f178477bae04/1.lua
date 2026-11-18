-- Threat: !InfrastructureShared
-- Name: f178477bae04
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
