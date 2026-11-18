-- Threat: !InfrastructureShared
-- Name: 4578a1a9ad6c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
