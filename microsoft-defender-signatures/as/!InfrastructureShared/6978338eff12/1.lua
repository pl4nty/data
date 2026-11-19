-- Threat: !InfrastructureShared
-- Name: 6978338eff12
-- Type: 21

if peattributes.no_security and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
