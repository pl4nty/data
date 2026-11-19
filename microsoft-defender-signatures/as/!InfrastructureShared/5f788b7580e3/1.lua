-- Threat: !InfrastructureShared
-- Name: 5f788b7580e3
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
