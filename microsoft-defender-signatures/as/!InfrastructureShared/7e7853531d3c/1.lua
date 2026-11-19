-- Threat: !InfrastructureShared
-- Name: 7e7853531d3c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
