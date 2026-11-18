-- Threat: !InfrastructureShared
-- Name: 96780a5382a4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
