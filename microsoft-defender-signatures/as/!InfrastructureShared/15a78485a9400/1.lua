-- Threat: !InfrastructureShared
-- Name: 15a78485a9400
-- Type: 21

if peattributes.isdll and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
