-- Threat: !InfrastructureShared
-- Name: db78d9ee8941
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
