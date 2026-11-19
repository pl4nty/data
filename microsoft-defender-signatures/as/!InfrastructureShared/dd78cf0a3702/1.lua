-- Threat: !InfrastructureShared
-- Name: dd78cf0a3702
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
