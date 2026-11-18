-- Threat: !InfrastructureShared
-- Name: 9478231424ef
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
