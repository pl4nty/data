-- Threat: !InfrastructureShared
-- Name: 267887ff58ef
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
