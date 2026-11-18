-- Threat: !InfrastructureShared
-- Name: 787809e7dbe7
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
