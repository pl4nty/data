-- Threat: !InfrastructureShared
-- Name: 9278564b1fc4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
