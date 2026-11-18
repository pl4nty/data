-- Threat: !InfrastructureShared
-- Name: 7e78d38be896
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
