-- Threat: !InfrastructureShared
-- Name: b078d8d8a905
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
