-- Threat: !InfrastructureShared
-- Name: dc7850174e9c
-- Type: 21

if peattributes.isdll and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
