-- Threat: !InfrastructureShared
-- Name: 9e78875e43b6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
