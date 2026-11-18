-- Threat: !InfrastructureShared
-- Name: 46782d6ba84e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
