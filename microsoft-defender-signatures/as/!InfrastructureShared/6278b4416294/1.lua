-- Threat: !InfrastructureShared
-- Name: 6278b4416294
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
