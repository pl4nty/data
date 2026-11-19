-- Threat: !InfrastructureShared
-- Name: 4678561864f2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
