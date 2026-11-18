-- Threat: !InfrastructureShared
-- Name: 5f78b9b6c32e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
