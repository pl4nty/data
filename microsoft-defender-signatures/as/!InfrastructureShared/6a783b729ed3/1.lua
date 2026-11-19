-- Threat: !InfrastructureShared
-- Name: 6a783b729ed3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
