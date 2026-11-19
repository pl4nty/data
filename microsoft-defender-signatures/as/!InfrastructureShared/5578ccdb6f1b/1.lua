-- Threat: !InfrastructureShared
-- Name: 5578ccdb6f1b
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
