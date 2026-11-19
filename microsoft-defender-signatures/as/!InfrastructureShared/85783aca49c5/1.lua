-- Threat: !InfrastructureShared
-- Name: 85783aca49c5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
