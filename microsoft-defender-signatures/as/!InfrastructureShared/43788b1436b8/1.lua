-- Threat: !InfrastructureShared
-- Name: 43788b1436b8
-- Type: 21

if peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
