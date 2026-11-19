-- Threat: !InfrastructureShared
-- Name: 37784c3c6ccb
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
