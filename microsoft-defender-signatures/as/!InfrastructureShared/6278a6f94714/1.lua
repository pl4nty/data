-- Threat: !InfrastructureShared
-- Name: 6278a6f94714
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
