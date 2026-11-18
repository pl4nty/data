-- Threat: !InfrastructureShared
-- Name: 7540d44e0869
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
