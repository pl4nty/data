-- Threat: !InfrastructureShared
-- Name: 5678326c1175
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
