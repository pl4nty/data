-- Threat: !InfrastructureShared
-- Name: 7d78646d81b9
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
