-- Threat: !InfrastructureShared
-- Name: 3f78526ee5f0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
