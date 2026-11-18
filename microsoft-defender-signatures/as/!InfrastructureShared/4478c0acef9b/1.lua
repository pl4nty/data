-- Threat: !InfrastructureShared
-- Name: 4478c0acef9b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
