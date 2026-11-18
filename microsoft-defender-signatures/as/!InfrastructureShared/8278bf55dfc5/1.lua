-- Threat: !InfrastructureShared
-- Name: 8278bf55dfc5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
