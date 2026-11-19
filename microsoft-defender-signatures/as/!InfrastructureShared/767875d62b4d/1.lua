-- Threat: !InfrastructureShared
-- Name: 767875d62b4d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
