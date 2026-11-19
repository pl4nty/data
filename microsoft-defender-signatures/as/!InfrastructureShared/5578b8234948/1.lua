-- Threat: !InfrastructureShared
-- Name: 5578b8234948
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
