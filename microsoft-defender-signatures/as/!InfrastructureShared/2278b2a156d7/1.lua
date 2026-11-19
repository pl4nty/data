-- Threat: !InfrastructureShared
-- Name: 2278b2a156d7
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
