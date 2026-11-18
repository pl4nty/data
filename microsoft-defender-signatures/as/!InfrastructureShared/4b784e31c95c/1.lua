-- Threat: !InfrastructureShared
-- Name: 4b784e31c95c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
