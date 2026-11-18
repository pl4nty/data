-- Threat: !InfrastructureShared
-- Name: ac7869140ed5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
