-- Threat: !InfrastructureShared
-- Name: 52780a500a4e
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
