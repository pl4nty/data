-- Threat: !InfrastructureShared
-- Name: 4d7811cc360d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
