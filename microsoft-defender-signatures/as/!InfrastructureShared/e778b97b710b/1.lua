-- Threat: !InfrastructureShared
-- Name: e778b97b710b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
