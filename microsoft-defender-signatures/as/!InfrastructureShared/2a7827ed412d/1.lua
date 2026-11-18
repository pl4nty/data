-- Threat: !InfrastructureShared
-- Name: 2a7827ed412d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
