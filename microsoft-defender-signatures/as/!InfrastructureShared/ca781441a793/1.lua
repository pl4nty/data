-- Threat: !InfrastructureShared
-- Name: ca781441a793
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
