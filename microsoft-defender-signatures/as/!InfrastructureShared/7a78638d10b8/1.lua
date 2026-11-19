-- Threat: !InfrastructureShared
-- Name: 7a78638d10b8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
