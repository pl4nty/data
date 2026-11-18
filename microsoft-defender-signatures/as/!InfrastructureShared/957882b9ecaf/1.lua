-- Threat: !InfrastructureShared
-- Name: 957882b9ecaf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
