-- Threat: !InfrastructureShared
-- Name: 5d78554dcab0
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
