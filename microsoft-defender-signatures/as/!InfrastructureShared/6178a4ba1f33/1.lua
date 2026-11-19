-- Threat: !InfrastructureShared
-- Name: 6178a4ba1f33
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
