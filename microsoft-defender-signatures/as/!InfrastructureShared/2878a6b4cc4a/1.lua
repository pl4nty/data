-- Threat: !InfrastructureShared
-- Name: 2878a6b4cc4a
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
