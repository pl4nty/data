-- Threat: !InfrastructureShared
-- Name: 3b782da9d69a
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
