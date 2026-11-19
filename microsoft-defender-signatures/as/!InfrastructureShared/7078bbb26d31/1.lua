-- Threat: !InfrastructureShared
-- Name: 7078bbb26d31
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
