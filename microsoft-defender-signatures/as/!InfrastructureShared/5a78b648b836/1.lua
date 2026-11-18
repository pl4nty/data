-- Threat: !InfrastructureShared
-- Name: 5a78b648b836
-- Type: 21

if peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
