-- Threat: !InfrastructureShared
-- Name: 5a78a79e205d
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
