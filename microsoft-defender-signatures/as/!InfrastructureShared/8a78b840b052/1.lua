-- Threat: !InfrastructureShared
-- Name: 8a78b840b052
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
