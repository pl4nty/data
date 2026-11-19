-- Threat: !InfrastructureShared
-- Name: 7c7894f7e1d2
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
