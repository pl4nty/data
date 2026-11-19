-- Threat: !InfrastructureShared
-- Name: ee783af58f90
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
