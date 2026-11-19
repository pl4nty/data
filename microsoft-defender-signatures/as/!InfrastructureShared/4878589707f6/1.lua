-- Threat: !InfrastructureShared
-- Name: 4878589707f6
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
