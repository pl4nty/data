-- Threat: !InfrastructureShared
-- Name: 96785c03e35a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
