-- Threat: !InfrastructureShared
-- Name: 2c78c200c302
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
