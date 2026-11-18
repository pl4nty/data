-- Threat: !InfrastructureShared
-- Name: 2778935afd6c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
