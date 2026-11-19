-- Threat: !InfrastructureShared
-- Name: 2478f1f302b2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
