-- Threat: !InfrastructureShared
-- Name: d0782ed95c82
-- Type: 21

if peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
