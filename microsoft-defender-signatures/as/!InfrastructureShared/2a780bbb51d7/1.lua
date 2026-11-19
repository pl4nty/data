-- Threat: !InfrastructureShared
-- Name: 2a780bbb51d7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
