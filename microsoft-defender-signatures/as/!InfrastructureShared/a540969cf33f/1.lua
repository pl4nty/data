-- Threat: !InfrastructureShared
-- Name: a540969cf33f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
