-- Threat: !InfrastructureShared
-- Name: 8778f0dedc86
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
