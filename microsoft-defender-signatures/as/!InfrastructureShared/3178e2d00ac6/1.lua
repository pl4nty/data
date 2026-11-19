-- Threat: !InfrastructureShared
-- Name: 3178e2d00ac6
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
