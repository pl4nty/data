-- Threat: !InfrastructureShared
-- Name: 4f78a7a9e938
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
