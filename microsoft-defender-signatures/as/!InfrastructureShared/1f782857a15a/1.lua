-- Threat: !InfrastructureShared
-- Name: 1f782857a15a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
