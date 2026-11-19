-- Threat: !InfrastructureShared
-- Name: 7078aa8b18cd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
