-- Threat: !InfrastructureShared
-- Name: a97892e2164e
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
