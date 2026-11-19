-- Threat: !InfrastructureShared
-- Name: 7678d7af2606
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
