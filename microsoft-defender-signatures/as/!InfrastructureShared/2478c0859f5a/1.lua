-- Threat: !InfrastructureShared
-- Name: 2478c0859f5a
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
