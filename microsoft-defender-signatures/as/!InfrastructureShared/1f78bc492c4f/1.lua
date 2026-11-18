-- Threat: !InfrastructureShared
-- Name: 1f78bc492c4f
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
