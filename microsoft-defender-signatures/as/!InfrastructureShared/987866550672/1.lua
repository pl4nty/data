-- Threat: !InfrastructureShared
-- Name: 987866550672
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
