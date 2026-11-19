-- Threat: !InfrastructureShared
-- Name: 7961d4932962
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
