-- Threat: !InfrastructureShared
-- Name: 7d7806be94cc
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
