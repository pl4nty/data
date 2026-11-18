-- Threat: !InfrastructureShared
-- Name: 1b78b2eb50d6
-- Type: 21

if peattributes.has_msilresources and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
