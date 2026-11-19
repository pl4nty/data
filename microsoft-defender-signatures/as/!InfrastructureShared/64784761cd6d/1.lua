-- Threat: !InfrastructureShared
-- Name: 64784761cd6d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
