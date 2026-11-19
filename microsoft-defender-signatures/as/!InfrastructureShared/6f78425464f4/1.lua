-- Threat: !InfrastructureShared
-- Name: 6f78425464f4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
