-- Threat: !InfrastructureShared
-- Name: 4c78d53ae3d7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
