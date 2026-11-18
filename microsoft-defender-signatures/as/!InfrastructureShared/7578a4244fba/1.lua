-- Threat: !InfrastructureShared
-- Name: 7578a4244fba
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
