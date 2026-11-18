-- Threat: !InfrastructureShared
-- Name: 7c78ea6f0760
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
