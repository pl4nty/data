-- Threat: !InfrastructureShared
-- Name: 6b78fd956805
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
