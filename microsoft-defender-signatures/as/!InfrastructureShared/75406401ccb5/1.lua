-- Threat: !InfrastructureShared
-- Name: 75406401ccb5
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
