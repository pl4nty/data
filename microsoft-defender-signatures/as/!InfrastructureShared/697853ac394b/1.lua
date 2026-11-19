-- Threat: !InfrastructureShared
-- Name: 697853ac394b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
