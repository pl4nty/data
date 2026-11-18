-- Threat: !InfrastructureShared
-- Name: 4478cad4a96b
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
