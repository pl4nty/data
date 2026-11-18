-- Threat: !InfrastructureShared
-- Name: 6078d5eb1496
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
