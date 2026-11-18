-- Threat: !InfrastructureShared
-- Name: 7a780cfc8ba9
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
