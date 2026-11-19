-- Threat: !InfrastructureShared
-- Name: 1f788671e889
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
