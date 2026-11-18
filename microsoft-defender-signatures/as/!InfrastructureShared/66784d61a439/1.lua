-- Threat: !InfrastructureShared
-- Name: 66784d61a439
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
