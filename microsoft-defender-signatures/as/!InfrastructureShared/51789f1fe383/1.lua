-- Threat: !InfrastructureShared
-- Name: 51789f1fe383
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
