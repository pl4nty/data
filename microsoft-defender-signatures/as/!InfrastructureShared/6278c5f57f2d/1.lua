-- Threat: !InfrastructureShared
-- Name: 6278c5f57f2d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
