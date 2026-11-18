-- Threat: !InfrastructureShared
-- Name: 5b788923fca7
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
