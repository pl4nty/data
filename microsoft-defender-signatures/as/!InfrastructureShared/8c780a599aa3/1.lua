-- Threat: !InfrastructureShared
-- Name: 8c780a599aa3
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
