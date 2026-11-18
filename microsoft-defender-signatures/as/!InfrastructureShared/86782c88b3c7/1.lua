-- Threat: !InfrastructureShared
-- Name: 86782c88b3c7
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
