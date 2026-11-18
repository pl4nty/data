-- Threat: !InfrastructureShared
-- Name: 8878503af874
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
