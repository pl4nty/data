-- Threat: !InfrastructureShared
-- Name: 3f78903e04f9
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
