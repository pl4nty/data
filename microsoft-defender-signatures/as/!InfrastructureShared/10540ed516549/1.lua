-- Threat: !InfrastructureShared
-- Name: 10540ed516549
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
