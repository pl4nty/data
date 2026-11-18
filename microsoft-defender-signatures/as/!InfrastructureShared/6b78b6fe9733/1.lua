-- Threat: !InfrastructureShared
-- Name: 6b78b6fe9733
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
