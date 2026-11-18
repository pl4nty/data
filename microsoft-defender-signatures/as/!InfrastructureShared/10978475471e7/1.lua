-- Threat: !InfrastructureShared
-- Name: 10978475471e7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
