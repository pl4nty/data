-- Threat: !InfrastructureShared
-- Name: 417833ce5050
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
