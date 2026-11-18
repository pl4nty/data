-- Threat: !InfrastructureShared
-- Name: 3178a0031957
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
