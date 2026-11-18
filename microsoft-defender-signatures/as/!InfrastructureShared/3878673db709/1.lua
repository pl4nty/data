-- Threat: !InfrastructureShared
-- Name: 3878673db709
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
