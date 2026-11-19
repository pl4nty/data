-- Threat: !InfrastructureShared
-- Name: 119788782ea84
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
