-- Threat: !InfrastructureShared
-- Name: d37874b6c9c1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
