-- Threat: !InfrastructureShared
-- Name: 567875772cd1
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
