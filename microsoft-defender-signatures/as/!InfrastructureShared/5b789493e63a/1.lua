-- Threat: !InfrastructureShared
-- Name: 5b789493e63a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
