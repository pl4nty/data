-- Threat: !InfrastructureShared
-- Name: 7e78f1aa36ef
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
