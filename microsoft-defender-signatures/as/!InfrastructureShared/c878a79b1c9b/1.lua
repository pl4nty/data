-- Threat: !InfrastructureShared
-- Name: c878a79b1c9b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
