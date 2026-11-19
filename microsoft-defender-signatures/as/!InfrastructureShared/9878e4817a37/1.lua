-- Threat: !InfrastructureShared
-- Name: 9878e4817a37
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
