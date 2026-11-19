-- Threat: !InfrastructureShared
-- Name: 687836fb7941
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
