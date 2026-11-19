-- Threat: !InfrastructureShared
-- Name: 82781c5ff101
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
