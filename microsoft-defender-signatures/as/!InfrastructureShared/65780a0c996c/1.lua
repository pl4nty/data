-- Threat: !InfrastructureShared
-- Name: 65780a0c996c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
