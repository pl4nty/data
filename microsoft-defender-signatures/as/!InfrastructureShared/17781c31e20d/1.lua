-- Threat: !InfrastructureShared
-- Name: 17781c31e20d
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
