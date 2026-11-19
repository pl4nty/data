-- Threat: !InfrastructureShared
-- Name: 8b78b010f225
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
