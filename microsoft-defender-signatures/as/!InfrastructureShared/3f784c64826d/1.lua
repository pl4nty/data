-- Threat: !InfrastructureShared
-- Name: 3f784c64826d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
