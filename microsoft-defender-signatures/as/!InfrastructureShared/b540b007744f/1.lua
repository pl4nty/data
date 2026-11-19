-- Threat: !InfrastructureShared
-- Name: b540b007744f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
