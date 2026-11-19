-- Threat: !InfrastructureShared
-- Name: 58788e2c8208
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
