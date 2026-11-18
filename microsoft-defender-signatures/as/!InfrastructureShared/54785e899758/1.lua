-- Threat: !InfrastructureShared
-- Name: 54785e899758
-- Type: 21

if peattributes.isdll and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
