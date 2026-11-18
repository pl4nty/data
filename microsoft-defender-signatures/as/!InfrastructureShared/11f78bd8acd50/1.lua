-- Threat: !InfrastructureShared
-- Name: 11f78bd8acd50
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
