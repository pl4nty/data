-- Threat: !InfrastructureShared
-- Name: 1b78ce17bd43
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
