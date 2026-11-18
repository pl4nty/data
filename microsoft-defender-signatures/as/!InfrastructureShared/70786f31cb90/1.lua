-- Threat: !InfrastructureShared
-- Name: 70786f31cb90
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
