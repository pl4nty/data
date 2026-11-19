-- Threat: !InfrastructureShared
-- Name: 3f78f08dc32f
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
