-- Threat: !InfrastructureShared
-- Name: 49789a98d098
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
