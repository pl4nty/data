-- Threat: !InfrastructureShared
-- Name: 5978add4f79f
-- Type: 21

if peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
