-- Threat: !InfrastructureShared
-- Name: bf7808720d1f
-- Type: 21

if peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
