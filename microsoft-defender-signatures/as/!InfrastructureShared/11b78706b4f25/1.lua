-- Threat: !InfrastructureShared
-- Name: 11b78706b4f25
-- Type: 21

if peattributes.isdll and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
