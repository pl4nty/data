-- Threat: !InfrastructureShared
-- Name: a278b95cd099
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
