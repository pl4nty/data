-- Threat: !InfrastructureShared
-- Name: 1d7813514558
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
