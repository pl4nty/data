-- Threat: !InfrastructureShared
-- Name: 8078225c1019
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
