-- Threat: !InfrastructureShared
-- Name: 5f78045599db
-- Type: 21

if peattributes.isdll and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
