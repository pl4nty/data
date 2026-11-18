-- Threat: !InfrastructureShared
-- Name: 3c7845f1296a
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
