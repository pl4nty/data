-- Threat: !InfrastructureShared
-- Name: 4b7886b6904e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
