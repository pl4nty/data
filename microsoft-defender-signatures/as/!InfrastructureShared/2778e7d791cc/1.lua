-- Threat: !InfrastructureShared
-- Name: 2778e7d791cc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
