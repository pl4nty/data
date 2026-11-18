-- Threat: !InfrastructureShared
-- Name: b778b4a22fc2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
