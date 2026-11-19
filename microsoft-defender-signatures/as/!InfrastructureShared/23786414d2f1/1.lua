-- Threat: !InfrastructureShared
-- Name: 23786414d2f1
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
