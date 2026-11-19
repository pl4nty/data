-- Threat: !InfrastructureShared
-- Name: 8178d3a2e184
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
