-- Threat: !InfrastructureShared
-- Name: 132783f89cc7b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
