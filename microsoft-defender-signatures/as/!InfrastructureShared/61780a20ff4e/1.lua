-- Threat: !InfrastructureShared
-- Name: 61780a20ff4e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
