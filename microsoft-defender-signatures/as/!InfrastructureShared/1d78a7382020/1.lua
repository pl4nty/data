-- Threat: !InfrastructureShared
-- Name: 1d78a7382020
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
