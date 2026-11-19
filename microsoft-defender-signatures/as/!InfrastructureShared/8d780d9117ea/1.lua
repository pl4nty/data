-- Threat: !InfrastructureShared
-- Name: 8d780d9117ea
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
