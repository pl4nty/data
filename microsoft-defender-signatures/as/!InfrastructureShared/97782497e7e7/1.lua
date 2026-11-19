-- Threat: !InfrastructureShared
-- Name: 97782497e7e7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
