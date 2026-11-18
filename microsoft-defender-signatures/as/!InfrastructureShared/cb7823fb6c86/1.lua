-- Threat: !InfrastructureShared
-- Name: cb7823fb6c86
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
