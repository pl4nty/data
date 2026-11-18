-- Threat: !InfrastructureShared
-- Name: 5d78a3b4f395
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
