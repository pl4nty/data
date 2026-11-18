-- Threat: !InfrastructureShared
-- Name: 6c78bbad0d7f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
