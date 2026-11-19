-- Threat: !InfrastructureShared
-- Name: f378bb1cfd61
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
