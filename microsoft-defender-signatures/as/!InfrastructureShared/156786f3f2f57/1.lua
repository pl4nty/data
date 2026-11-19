-- Threat: !InfrastructureShared
-- Name: 156786f3f2f57
-- Type: 21

if peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
