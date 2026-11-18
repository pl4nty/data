-- Threat: !InfrastructureShared
-- Name: 1c278cca531d8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
