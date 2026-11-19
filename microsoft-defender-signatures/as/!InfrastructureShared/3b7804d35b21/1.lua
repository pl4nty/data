-- Threat: !InfrastructureShared
-- Name: 3b7804d35b21
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
