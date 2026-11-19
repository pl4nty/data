-- Threat: !InfrastructureShared
-- Name: 7578c057f2c6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
