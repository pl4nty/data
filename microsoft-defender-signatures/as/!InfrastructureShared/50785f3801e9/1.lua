-- Threat: !InfrastructureShared
-- Name: 50785f3801e9
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
