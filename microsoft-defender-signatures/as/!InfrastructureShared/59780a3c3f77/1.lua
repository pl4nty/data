-- Threat: !InfrastructureShared
-- Name: 59780a3c3f77
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
