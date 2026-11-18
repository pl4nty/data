-- Threat: !InfrastructureShared
-- Name: 1227851e2c6cc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
