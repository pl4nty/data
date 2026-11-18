-- Threat: !InfrastructureShared
-- Name: 43781f05d1ae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
