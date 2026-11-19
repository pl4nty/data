-- Threat: !InfrastructureShared
-- Name: 5478fcbe367f
-- Type: 21

if peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
