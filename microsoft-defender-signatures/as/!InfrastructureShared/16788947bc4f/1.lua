-- Threat: !InfrastructureShared
-- Name: 16788947bc4f
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
