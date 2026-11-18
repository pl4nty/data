-- Threat: !InfrastructureShared
-- Name: d378d978be16
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
