-- Threat: !InfrastructureShared
-- Name: 337832167941
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
