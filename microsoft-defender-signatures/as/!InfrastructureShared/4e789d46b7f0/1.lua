-- Threat: !InfrastructureShared
-- Name: 4e789d46b7f0
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
