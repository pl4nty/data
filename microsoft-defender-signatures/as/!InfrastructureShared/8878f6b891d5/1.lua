-- Threat: !InfrastructureShared
-- Name: 8878f6b891d5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
