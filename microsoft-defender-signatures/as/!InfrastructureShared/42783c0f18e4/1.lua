-- Threat: !InfrastructureShared
-- Name: 42783c0f18e4
-- Type: 21

if peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
