-- Threat: !InfrastructureShared
-- Name: 5a785f1d6d54
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
