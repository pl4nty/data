-- Threat: !InfrastructureShared
-- Name: 8378803fddc0
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
