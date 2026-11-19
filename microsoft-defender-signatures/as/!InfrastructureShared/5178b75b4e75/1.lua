-- Threat: !InfrastructureShared
-- Name: 5178b75b4e75
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
