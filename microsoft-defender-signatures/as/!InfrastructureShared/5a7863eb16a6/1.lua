-- Threat: !InfrastructureShared
-- Name: 5a7863eb16a6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
