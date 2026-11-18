-- Threat: !InfrastructureShared
-- Name: 3e788bb7a596
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
