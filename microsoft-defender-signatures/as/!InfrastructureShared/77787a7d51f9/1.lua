-- Threat: !InfrastructureShared
-- Name: 77787a7d51f9
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
