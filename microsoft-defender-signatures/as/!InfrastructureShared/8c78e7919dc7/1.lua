-- Threat: !InfrastructureShared
-- Name: 8c78e7919dc7
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
