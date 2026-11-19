-- Threat: !InfrastructureShared
-- Name: 4f78c4747ce7
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
