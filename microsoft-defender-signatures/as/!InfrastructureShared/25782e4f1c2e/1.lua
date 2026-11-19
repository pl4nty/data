-- Threat: !InfrastructureShared
-- Name: 25782e4f1c2e
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
