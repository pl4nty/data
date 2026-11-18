-- Threat: !InfrastructureShared
-- Name: 2078d2ec93b7
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
