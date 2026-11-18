-- Threat: !InfrastructureShared
-- Name: 7540c196e971
-- Type: 21

if peattributes.isexe == true or peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
