-- Threat: !InfrastructureShared
-- Name: 2278b0b3c5cc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
