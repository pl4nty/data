-- Threat: !InfrastructureShared
-- Name: 19378380f43e7
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
