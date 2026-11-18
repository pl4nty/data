-- Threat: !InfrastructureShared
-- Name: 4378f234a840
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
