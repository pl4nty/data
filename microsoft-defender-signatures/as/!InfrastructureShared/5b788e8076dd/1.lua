-- Threat: !InfrastructureShared
-- Name: 5b788e8076dd
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
