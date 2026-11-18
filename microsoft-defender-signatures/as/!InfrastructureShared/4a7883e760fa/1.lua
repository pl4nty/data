-- Threat: !InfrastructureShared
-- Name: 4a7883e760fa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
