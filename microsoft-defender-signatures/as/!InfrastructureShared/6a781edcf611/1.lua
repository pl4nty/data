-- Threat: !InfrastructureShared
-- Name: 6a781edcf611
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
