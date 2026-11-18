-- Threat: !InfrastructureShared
-- Name: 36788345ff3a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
