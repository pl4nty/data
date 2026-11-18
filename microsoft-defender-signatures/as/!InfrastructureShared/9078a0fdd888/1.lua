-- Threat: !InfrastructureShared
-- Name: 9078a0fdd888
-- Type: 21

if peattributes.isdll and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
