-- Threat: !InfrastructureShared
-- Name: 5078382bf432
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
