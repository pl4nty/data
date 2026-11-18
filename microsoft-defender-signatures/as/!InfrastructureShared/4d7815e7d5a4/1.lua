-- Threat: !InfrastructureShared
-- Name: 4d7815e7d5a4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
