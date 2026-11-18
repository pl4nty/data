-- Threat: !InfrastructureShared
-- Name: 23788a7b168e
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
