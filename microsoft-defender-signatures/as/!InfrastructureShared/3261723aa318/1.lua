-- Threat: !InfrastructureShared
-- Name: 3261723aa318
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
