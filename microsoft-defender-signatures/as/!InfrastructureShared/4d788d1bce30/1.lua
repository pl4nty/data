-- Threat: !InfrastructureShared
-- Name: 4d788d1bce30
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
