-- Threat: !InfrastructureShared
-- Name: 4a78dcd4c8be
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
