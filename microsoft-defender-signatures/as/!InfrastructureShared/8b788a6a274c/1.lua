-- Threat: !InfrastructureShared
-- Name: 8b788a6a274c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
