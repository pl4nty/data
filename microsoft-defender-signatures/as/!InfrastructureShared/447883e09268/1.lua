-- Threat: !InfrastructureShared
-- Name: 447883e09268
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
