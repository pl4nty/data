-- Threat: !InfrastructureShared
-- Name: 354082ae83c7
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
