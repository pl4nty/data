-- Threat: !InfrastructureShared
-- Name: 27788207e999
-- Type: 21

if peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
