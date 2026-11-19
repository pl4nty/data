-- Threat: !InfrastructureShared
-- Name: 6678e0a8ecfa
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
