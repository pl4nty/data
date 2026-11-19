-- Threat: !InfrastructureShared
-- Name: 44780e74cfca
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
