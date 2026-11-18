-- Threat: !InfrastructureShared
-- Name: ab78b3afcf71
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
