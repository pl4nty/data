-- Threat: !InfrastructureShared
-- Name: 8878bdde270d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
