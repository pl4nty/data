-- Threat: !InfrastructureShared
-- Name: 7a780b51058f
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
