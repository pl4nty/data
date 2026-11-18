-- Threat: !InfrastructureShared
-- Name: cd786cf8d9d8
-- Type: 21

if peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
