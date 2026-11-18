-- Threat: !InfrastructureShared
-- Name: 8078e87df3d0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
