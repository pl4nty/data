-- Threat: !InfrastructureShared
-- Name: 4678adce5f75
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
