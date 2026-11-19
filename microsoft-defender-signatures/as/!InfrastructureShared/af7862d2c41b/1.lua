-- Threat: !InfrastructureShared
-- Name: af7862d2c41b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
