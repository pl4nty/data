-- Threat: !InfrastructureShared
-- Name: 1f78a2aa98f4
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
