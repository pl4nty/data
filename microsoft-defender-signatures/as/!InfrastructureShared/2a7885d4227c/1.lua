-- Threat: !InfrastructureShared
-- Name: 2a7885d4227c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
