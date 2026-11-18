-- Threat: !InfrastructureShared
-- Name: af784c6c5dfb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
