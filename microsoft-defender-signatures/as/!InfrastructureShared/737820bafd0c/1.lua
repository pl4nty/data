-- Threat: !InfrastructureShared
-- Name: 737820bafd0c
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
