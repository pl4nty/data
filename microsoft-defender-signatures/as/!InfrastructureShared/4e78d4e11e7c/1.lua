-- Threat: !InfrastructureShared
-- Name: 4e78d4e11e7c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
