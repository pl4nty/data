-- Threat: !InfrastructureShared
-- Name: 8878b1507a0c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
