-- Threat: !InfrastructureShared
-- Name: 457843b2c7d2
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
