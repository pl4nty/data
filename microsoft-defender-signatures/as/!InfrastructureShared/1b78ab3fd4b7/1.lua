-- Threat: !InfrastructureShared
-- Name: 1b78ab3fd4b7
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
