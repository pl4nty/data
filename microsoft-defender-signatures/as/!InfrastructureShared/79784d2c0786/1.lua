-- Threat: !InfrastructureShared
-- Name: 79784d2c0786
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
