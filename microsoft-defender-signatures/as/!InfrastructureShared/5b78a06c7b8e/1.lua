-- Threat: !InfrastructureShared
-- Name: 5b78a06c7b8e
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
