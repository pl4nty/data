-- Threat: !InfrastructureShared
-- Name: a8789e6d8208
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
