-- Threat: !InfrastructureShared
-- Name: a07857eaf5f1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
