-- Threat: !InfrastructureShared
-- Name: 9d78fd36ab3c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
