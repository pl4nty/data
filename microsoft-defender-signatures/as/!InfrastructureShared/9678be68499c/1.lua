-- Threat: !InfrastructureShared
-- Name: 9678be68499c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
