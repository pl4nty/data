-- Threat: !InfrastructureShared
-- Name: 7e78e5eb26c5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
