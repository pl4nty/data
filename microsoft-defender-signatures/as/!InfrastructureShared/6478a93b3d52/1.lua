-- Threat: !InfrastructureShared
-- Name: 6478a93b3d52
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
