-- Threat: !InfrastructureShared
-- Name: 3f78125e2999
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
