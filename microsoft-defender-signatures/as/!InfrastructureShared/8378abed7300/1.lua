-- Threat: !InfrastructureShared
-- Name: 8378abed7300
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
