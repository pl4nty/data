-- Threat: !InfrastructureShared
-- Name: 75785c5db7a7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
