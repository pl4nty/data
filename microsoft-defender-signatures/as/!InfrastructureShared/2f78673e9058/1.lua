-- Threat: !InfrastructureShared
-- Name: 2f78673e9058
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
