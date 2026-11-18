-- Threat: !InfrastructureShared
-- Name: 5b78fc8e501f
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
