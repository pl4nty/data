-- Threat: !InfrastructureShared
-- Name: 64780a25f533
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
