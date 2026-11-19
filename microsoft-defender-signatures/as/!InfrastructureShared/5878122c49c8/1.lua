-- Threat: !InfrastructureShared
-- Name: 5878122c49c8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
