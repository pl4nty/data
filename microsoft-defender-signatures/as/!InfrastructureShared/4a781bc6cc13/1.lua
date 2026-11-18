-- Threat: !InfrastructureShared
-- Name: 4a781bc6cc13
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
