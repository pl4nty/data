-- Threat: !InfrastructureShared
-- Name: aa78c296ae04
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
