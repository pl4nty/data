-- Threat: !InfrastructureShared
-- Name: 8e78362e23b6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
