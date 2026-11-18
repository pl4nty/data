-- Threat: !InfrastructureShared
-- Name: a178b8aa81b2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
