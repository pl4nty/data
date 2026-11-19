-- Threat: !InfrastructureShared
-- Name: 5378fa238281
-- Type: 21

if peattributes.isdll and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
