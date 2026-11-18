-- Threat: !InfrastructureShared
-- Name: 7f7885647ffa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
