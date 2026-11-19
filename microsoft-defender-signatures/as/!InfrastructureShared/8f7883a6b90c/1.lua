-- Threat: !InfrastructureShared
-- Name: 8f7883a6b90c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
