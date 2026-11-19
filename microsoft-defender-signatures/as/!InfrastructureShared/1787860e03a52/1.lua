-- Threat: !InfrastructureShared
-- Name: 1787860e03a52
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
