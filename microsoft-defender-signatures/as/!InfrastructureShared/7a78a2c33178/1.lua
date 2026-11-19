-- Threat: !InfrastructureShared
-- Name: 7a78a2c33178
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
