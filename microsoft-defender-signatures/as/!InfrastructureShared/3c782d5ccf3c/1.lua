-- Threat: !InfrastructureShared
-- Name: 3c782d5ccf3c
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
