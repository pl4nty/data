-- Threat: !InfrastructureShared
-- Name: e278349c40d0
-- Type: 21

if peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
