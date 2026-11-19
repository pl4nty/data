-- Threat: !InfrastructureShared
-- Name: 8878cb3cbdc2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
