-- Threat: !InfrastructureShared
-- Name: 1567842b4836c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
