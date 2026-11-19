-- Threat: !InfrastructureShared
-- Name: 857870216981
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
