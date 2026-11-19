-- Threat: !InfrastructureShared
-- Name: c56156393a4b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
