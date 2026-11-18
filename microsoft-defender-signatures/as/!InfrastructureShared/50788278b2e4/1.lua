-- Threat: !InfrastructureShared
-- Name: 50788278b2e4
-- Type: 21

if peattributes.isdll and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
