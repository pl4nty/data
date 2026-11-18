-- Threat: !InfrastructureShared
-- Name: 10278a0ee8fa3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
