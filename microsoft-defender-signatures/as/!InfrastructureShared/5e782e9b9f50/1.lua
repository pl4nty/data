-- Threat: !InfrastructureShared
-- Name: 5e782e9b9f50
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
