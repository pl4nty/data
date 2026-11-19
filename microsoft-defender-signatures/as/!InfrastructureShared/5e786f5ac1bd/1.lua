-- Threat: !InfrastructureShared
-- Name: 5e786f5ac1bd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
