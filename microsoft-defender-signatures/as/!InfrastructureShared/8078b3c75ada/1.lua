-- Threat: !InfrastructureShared
-- Name: 8078b3c75ada
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
