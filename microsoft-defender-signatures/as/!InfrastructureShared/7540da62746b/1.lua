-- Threat: !InfrastructureShared
-- Name: 7540da62746b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
