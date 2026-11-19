-- Threat: !InfrastructureShared
-- Name: c478578bd4ef
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
