-- Threat: !InfrastructureShared
-- Name: 7778a9387f88
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
