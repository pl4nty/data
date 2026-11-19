-- Threat: !InfrastructureShared
-- Name: 92781a25c825
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
