-- Threat: !InfrastructureShared
-- Name: 7540c0452987
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
