-- Threat: !InfrastructureShared
-- Name: 47786a755e43
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
