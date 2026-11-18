-- Threat: !InfrastructureShared
-- Name: 2f783a6feb76
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
