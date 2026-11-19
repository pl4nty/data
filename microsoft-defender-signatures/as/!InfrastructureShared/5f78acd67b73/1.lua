-- Threat: !InfrastructureShared
-- Name: 5f78acd67b73
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
