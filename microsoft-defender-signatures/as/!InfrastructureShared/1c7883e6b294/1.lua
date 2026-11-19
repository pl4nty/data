-- Threat: !InfrastructureShared
-- Name: 1c7883e6b294
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
