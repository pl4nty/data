-- Threat: !InfrastructureShared
-- Name: 5f789a537547
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
