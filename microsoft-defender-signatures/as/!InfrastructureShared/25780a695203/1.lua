-- Threat: !InfrastructureShared
-- Name: 25780a695203
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
