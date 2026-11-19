-- Threat: !InfrastructureShared
-- Name: f5780e7b3567
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
