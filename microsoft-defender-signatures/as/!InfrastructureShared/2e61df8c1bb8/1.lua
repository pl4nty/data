-- Threat: !InfrastructureShared
-- Name: 2e61df8c1bb8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
