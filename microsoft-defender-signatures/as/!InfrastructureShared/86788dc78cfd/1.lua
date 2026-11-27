-- Threat: !InfrastructureShared
-- Name: 86788dc78cfd
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
