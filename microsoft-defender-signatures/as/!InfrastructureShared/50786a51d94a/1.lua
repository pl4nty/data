-- Threat: !InfrastructureShared
-- Name: 50786a51d94a
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
