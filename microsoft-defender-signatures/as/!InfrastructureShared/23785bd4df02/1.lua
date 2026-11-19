-- Threat: !InfrastructureShared
-- Name: 23785bd4df02
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
