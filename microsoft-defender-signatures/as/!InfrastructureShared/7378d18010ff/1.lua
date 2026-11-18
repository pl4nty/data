-- Threat: !InfrastructureShared
-- Name: 7378d18010ff
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
