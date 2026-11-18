-- Threat: !InfrastructureShared
-- Name: 8c78b1e85d76
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
