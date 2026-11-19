-- Threat: !InfrastructureShared
-- Name: 4778f02ce900
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
