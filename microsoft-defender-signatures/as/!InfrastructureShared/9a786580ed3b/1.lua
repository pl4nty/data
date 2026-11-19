-- Threat: !InfrastructureShared
-- Name: 9a786580ed3b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
