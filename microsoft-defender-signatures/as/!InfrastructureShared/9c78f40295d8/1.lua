-- Threat: !InfrastructureShared
-- Name: 9c78f40295d8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
