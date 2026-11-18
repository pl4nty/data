-- Threat: !InfrastructureShared
-- Name: 7878c081e5e5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
