-- Threat: !InfrastructureShared
-- Name: 787857fb596a
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
