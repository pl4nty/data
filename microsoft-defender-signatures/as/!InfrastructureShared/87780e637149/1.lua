-- Threat: !InfrastructureShared
-- Name: 87780e637149
-- Type: 21

if peattributes.isdll and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
