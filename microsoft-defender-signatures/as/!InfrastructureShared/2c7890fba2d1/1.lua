-- Threat: !InfrastructureShared
-- Name: 2c7890fba2d1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
