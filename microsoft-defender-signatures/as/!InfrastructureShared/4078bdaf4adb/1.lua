-- Threat: !InfrastructureShared
-- Name: 4078bdaf4adb
-- Type: 21

if peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
