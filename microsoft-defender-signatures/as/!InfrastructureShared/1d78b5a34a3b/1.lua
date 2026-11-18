-- Threat: !InfrastructureShared
-- Name: 1d78b5a34a3b
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
