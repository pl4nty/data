-- Threat: !InfrastructureShared
-- Name: 1e78f68e1e9f
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
