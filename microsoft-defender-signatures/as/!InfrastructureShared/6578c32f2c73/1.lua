-- Threat: !InfrastructureShared
-- Name: 6578c32f2c73
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
