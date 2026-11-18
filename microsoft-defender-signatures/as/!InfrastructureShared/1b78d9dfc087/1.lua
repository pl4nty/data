-- Threat: !InfrastructureShared
-- Name: 1b78d9dfc087
-- Type: 21

if peattributes.ismsil and peattributes.isexe and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
