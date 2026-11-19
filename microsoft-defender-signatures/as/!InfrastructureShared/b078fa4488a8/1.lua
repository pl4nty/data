-- Threat: !InfrastructureShared
-- Name: b078fa4488a8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
