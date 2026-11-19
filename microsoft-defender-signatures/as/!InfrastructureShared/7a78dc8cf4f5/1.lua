-- Threat: !InfrastructureShared
-- Name: 7a78dc8cf4f5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
