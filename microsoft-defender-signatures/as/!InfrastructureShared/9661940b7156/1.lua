-- Threat: !InfrastructureShared
-- Name: 9661940b7156
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
