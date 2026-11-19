-- Threat: !InfrastructureShared
-- Name: 35780a110a65
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
