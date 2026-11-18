-- Threat: !InfrastructureShared
-- Name: 697884d112c7
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
