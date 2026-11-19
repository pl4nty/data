-- Threat: !InfrastructureShared
-- Name: 35788be78556
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
