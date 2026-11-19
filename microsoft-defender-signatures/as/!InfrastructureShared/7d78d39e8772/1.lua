-- Threat: !InfrastructureShared
-- Name: 7d78d39e8772
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
