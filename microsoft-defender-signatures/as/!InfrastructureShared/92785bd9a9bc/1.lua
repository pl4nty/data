-- Threat: !InfrastructureShared
-- Name: 92785bd9a9bc
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
