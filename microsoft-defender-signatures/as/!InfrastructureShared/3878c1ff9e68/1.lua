-- Threat: !InfrastructureShared
-- Name: 3878c1ff9e68
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
