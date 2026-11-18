-- Threat: !InfrastructureShared
-- Name: 9078fcc1d2ad
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
