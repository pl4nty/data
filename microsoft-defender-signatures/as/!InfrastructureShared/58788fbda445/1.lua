-- Threat: !InfrastructureShared
-- Name: 58788fbda445
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
