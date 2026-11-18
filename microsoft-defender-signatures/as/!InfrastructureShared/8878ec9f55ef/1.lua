-- Threat: !InfrastructureShared
-- Name: 8878ec9f55ef
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
