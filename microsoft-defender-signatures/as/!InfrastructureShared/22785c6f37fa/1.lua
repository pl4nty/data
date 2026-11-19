-- Threat: !InfrastructureShared
-- Name: 22785c6f37fa
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
