-- Threat: !InfrastructureShared
-- Name: 5b78b245b988
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
