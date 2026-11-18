-- Threat: !InfrastructureShared
-- Name: 7d78565e5151
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
