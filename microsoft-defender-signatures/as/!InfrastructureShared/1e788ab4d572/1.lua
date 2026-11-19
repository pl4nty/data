-- Threat: !InfrastructureShared
-- Name: 1e788ab4d572
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
