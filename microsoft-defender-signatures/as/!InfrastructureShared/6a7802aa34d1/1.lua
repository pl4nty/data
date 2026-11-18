-- Threat: !InfrastructureShared
-- Name: 6a7802aa34d1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
