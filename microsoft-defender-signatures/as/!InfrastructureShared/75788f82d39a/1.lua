-- Threat: !InfrastructureShared
-- Name: 75788f82d39a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
