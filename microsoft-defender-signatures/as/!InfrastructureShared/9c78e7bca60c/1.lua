-- Threat: !InfrastructureShared
-- Name: 9c78e7bca60c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
