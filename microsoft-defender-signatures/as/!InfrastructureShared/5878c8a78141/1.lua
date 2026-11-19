-- Threat: !InfrastructureShared
-- Name: 5878c8a78141
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
