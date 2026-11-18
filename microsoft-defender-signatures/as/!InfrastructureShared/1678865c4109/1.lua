-- Threat: !InfrastructureShared
-- Name: 1678865c4109
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
