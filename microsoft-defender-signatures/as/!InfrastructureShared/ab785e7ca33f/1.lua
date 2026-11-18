-- Threat: !InfrastructureShared
-- Name: ab785e7ca33f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
