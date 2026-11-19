-- Threat: !InfrastructureShared
-- Name: 1c78b8b9a733
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
