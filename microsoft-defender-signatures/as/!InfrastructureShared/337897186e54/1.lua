-- Threat: !InfrastructureShared
-- Name: 337897186e54
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
