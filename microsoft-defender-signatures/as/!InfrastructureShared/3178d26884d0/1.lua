-- Threat: !InfrastructureShared
-- Name: 3178d26884d0
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
