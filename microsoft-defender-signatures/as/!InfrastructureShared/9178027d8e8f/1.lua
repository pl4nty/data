-- Threat: !InfrastructureShared
-- Name: 9178027d8e8f
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
