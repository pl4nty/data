-- Threat: !InfrastructureShared
-- Name: 626159cc0fa6
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
