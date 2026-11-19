-- Threat: !InfrastructureShared
-- Name: 9778c3ecc2db
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
