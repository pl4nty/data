-- Threat: !InfrastructureShared
-- Name: 3b7823a7ea7a
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
