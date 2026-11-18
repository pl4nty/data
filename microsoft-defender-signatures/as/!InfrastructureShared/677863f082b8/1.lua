-- Threat: !InfrastructureShared
-- Name: 677863f082b8
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
