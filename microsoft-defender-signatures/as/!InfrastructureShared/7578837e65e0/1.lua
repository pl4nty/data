-- Threat: !InfrastructureShared
-- Name: 7578837e65e0
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
