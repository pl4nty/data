-- Threat: !InfrastructureShared
-- Name: 8c781c592045
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
