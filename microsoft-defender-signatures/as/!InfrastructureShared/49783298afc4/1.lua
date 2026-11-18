-- Threat: !InfrastructureShared
-- Name: 49783298afc4
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
