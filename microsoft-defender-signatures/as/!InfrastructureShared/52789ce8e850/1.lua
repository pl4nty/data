-- Threat: !InfrastructureShared
-- Name: 52789ce8e850
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
