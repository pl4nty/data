-- Threat: !InfrastructureShared
-- Name: 4078d8e2d75e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
